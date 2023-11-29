import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:dart_style/dart_style.dart';
import 'package:gluestack_flutter_pro/style/script_test/styles_to_be_generated.dart';
//Approach 2: run script to get toStirng method, rest all same as appr 1 from instructions perspective

//TODO: Make the GGStyle constructors n all const
//TODO: Take load off formatting and impro via Desc Style toString!

void main() async {
  print('...............Process Started............');
  String currentDirectory = Directory.current.path;

  String filePath = '$currentDirectory/generated_gs_style.dart';

  StringBuffer generatorBuffer = StringBuffer();
  //Change incase of project name change or stuff.....
  generatorBuffer.writeln('''
import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
//import 'package:gluestack_flutter_pro/style/base_style.dart';
''');

  for (Style style in stylesToBeGenerated) {
    //TODO: make it const
    generatorBuffer.writeln(
        """GSStyle ${style.generatedStyleName} = ${GSStyle.fromMap(data: style.styleData, descendantStyle: style.descendantStyle ?? []).merge(GSStyle.fromMap(data: style.mergeStyleData))};""");
  }

  File file = File(filePath);

  file.writeAsStringSync(generatorBuffer.toString());
  await cleanify(filePath);
  print('Process........Was.......Completed!');
  print('Style Generated!! \nAvailable @: ${file.absolute.path} :)');
  // print('Cross-Verification Path: ${filePath}');
}

Future<void> cleanify(String filePath) async {
  try {
    String fileContent = await File(filePath).readAsString();

    List<String> lines = LineSplitter.split(fileContent)
        .where((line) => !line.contains('null'))
        .toList();

    final cleanedText = lines.join('\n');
    final res = cleanifyFormatter(cleanedText);
    // final re = removeMoreStyles(res);

    await File(filePath).writeAsString(res);
  } catch (e) {
    print('Error: $e');
  }
}

String cleanifyFormatter(String content) {
  final formatter = DartFormatter();
  var modified = formatter.format(content);

  String helper(String code) {
    List<String> lines =
        LineSplitter.split(code).where((line) => !line.contains('()')).toList();
    //for removing empty descendant styles
    List<String> lines2 = lines.where((line) => !line.contains('{}')).toList();

    final cleanedText = lines2.join('\n');
    code = formatter.format(cleanedText);
    return code;
  }

  while (modified.contains('()') || modified.contains('{}')) {
    var result = helper(modified);
    modified = result;
  }

  return formatEdgeInsets(modified);
}


String formatEdgeInsets(String content) {
  final lines = LineSplitter.split(content);

  final modifiedLines = lines.map((line) {
    if (line.contains('EdgeInsets')) {
      // Modify the line if it contains EdgeInsets
      final formattedEdgeInsets = parseAndFormatEdgeInsets(line);
      return formattedEdgeInsets ?? line;
    }

    return line;
  });

  return modifiedLines.join('\n');
}

String? parseAndFormatEdgeInsets(String line) {
  final regex = RegExp(r'EdgeInsets\(\s*([\d\.]+)\s*,\s*([\d\.]+)\s*,\s*([\d\.]+)\s*,\s*([\d\.]+)\s*\)');

  final match = regex.firstMatch(line);

  if (match != null) {
    final double left = double.parse(match.group(1)!);
    final double top = double.parse(match.group(2)!);
    final double right = double.parse(match.group(3)!);
    final double bottom = double.parse(match.group(4)!);

    return 'padding: EdgeInsets.fromLTRB($left, $top, $right, $bottom),';
  }

  return null; // Return null if no formatting is applied
}