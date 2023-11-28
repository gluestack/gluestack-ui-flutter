import 'dart:collection';
import 'dart:io';
import 'dart:convert';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/utils/generator/styles_to_be_generated.dart';
import 'package:dart_style/dart_style.dart';

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
        """GSStyle ${style.generatedStyleName} = ${GSStyle.fromMap(data: style.styleData, descendantStyle: style.descendantStyle ?? [])};""");
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

    final cleanedText = lines.join('\n');
    code = formatter.format(cleanedText);
    return code;
  }

  while (modified.contains('()')) {
    var result = helper(modified);
    modified = result;
  }

  return modified;
}
