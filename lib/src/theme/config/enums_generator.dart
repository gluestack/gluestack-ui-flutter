import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

StringBuffer finalOutput = StringBuffer();

void main() {
  final currentDirectory = Directory.current;
  crawlDirectory(currentDirectory);

  //For debug purposes
  // readFile(File('./text/text.dart'));
}

void crawlDirectory(Directory dir) {
  dir.list(recursive: true).listen((FileSystemEntity entity) {
    if (entity is File && entity.path.endsWith('.dart')) {
      readFile(entity);
    }
  });
}

void readFile(File file) {
  try {
    final contents = file.readAsStringSync();
    final pattern = RegExp(
        r'const\s+Map<String,\s*dynamic>\s+(\w+)\s*=\s*({[^;]+})',
        dotAll: true);
    for (var match in pattern.allMatches(contents)) {
      final mapName = match.group(1);
      String? mapData = match.group(2);

      // print('${mapName} \n ${mapData} \n--------------');
      if (mapData != null && mapData.contains('variants')) {
        //fix for text n buttonGrp have true as bool directly unlike other places like heading n truegray clr stuff
        if (mapName == 'textData' || mapName == 'buttonGroupData') {
          mapData = mapData.replaceAll('true', r"'temp'");
          mapData = mapData.replaceAll('false', r"'temp'");
        }

        //fix for that $ sign issue + other , issues
        mapData = mapData.replaceAll(r'\$', "");
        mapData = mapData.replaceAll(r"'", r'"');
        mapData = mapData.replaceAll(RegExp(r',\s*}'), '}');
        mapData = mapData.replaceAll(RegExp(r',\s*}'), ']');
        mapData = mapData.replaceAll(
            RegExp(r'(?<=})\s*,\s*(?=])|(?<=])\s*,\s*(?=})'), '');

        // writeToFile('./output.txt', mapData);
        final map = jsonDecode(mapData);

        final variants = map['variants'];
        // print(variants);

        if (variants is Map<String, dynamic>) {
          generateEnum(mapName ?? 'DebugErrorValue-CheckScript', variants);
        }
      } else {
        if (kDebugMode) {
          print('No Variants exist for: $mapName');
        }
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error parsing file ${file.path}: $e');
    }
  }
}

void generateEnum(String mapName, Map<String, dynamic> variants) {
  bool sizeExists = false;
  bool actionsExists = false;
  bool variantsExists = false;
  bool spaceExists = false;
  bool placementExists = false;
  // bool radiusExists = false;
  List<String> variantsList = [];
  List<String> sizes = [];
  List<String> actions = [];
  List<String> spaces = [];
  List<String> placement = [];
  // List<String> radius = [];

  variants.forEach((key, value) {
    if (key == 'size') {
      sizeExists = true;
      sizes.addAll((value as Map<String, dynamic>).keys);
    }
    if (key == 'action') {
      actionsExists = true;
      actions.addAll((value as Map<String, dynamic>).keys);
    }
    if (key == 'variant') {
      variantsExists = true;
      variantsList.addAll((value as Map<String, dynamic>).keys);
    }
    if (key == 'space') {
      spaceExists = true;
      spaces.addAll((value as Map<String, dynamic>).keys);
    }
    if (key == 'placement') {
      placementExists = true;
      placement.addAll((value as Map<String, dynamic>).keys);
    }
    // if (key == 'radius') {
    //   radiusExists = true;
    //   radius.addAll((value as Map<String, dynamic>).keys);
    // }
  });

  //variants

  if (variantsExists) {
    //fix for default variant in [TextArea variants]
    variantsList.removeWhere((element) => element == 'default');

    final enumName = formatGSEnumName(mapName.replaceFirst('Data', 'Variants'));
    finalOutput.writeln('enum $enumName {');
    for (var e in variantsList) {
      finalOutput.writeln('$e,');
    }
    finalOutput.writeln('}\n');
  }

  //Action Enums
  if (actionsExists) {
    //fix for default action in [Button Actions]
    actions.removeWhere((element) => element == 'default');

    final enumName = formatGSEnumName(mapName.replaceFirst('Data', 'Actions'));

    finalOutput.writeln('enum $enumName {');
    for (var e in actions) {
      finalOutput.writeln('$e,');
    }

    finalOutput.writeln('}\n');
  }

  //size Enums
  if (sizeExists) {
    final enumName = formatGSEnumName(mapName.replaceFirst('Data', 'Sizes'));

    finalOutput.writeln('enum $enumName {');
    for (var e in sizes) {
      finalOutput.writeln('\$$e,');
    }
    finalOutput.writeln('}\n');
  }

  //space Enums
  if (spaceExists) {
    final enumName = formatGSEnumName(mapName.replaceFirst('Data', 'Spaces'));
    finalOutput.writeln('enum $enumName {');
    for (var e in spaces) {
      finalOutput.writeln('\$$e,');
    }
    finalOutput.writeln('}\n');
  }

  //placement Enums
  if (placementExists) {
    final enumName =
        formatGSEnumName(mapName.replaceFirst('Data', 'Placements'));
    finalOutput.writeln('enum $enumName {');
    for (var e in placement) {
      finalOutput.writeln('${capitalizeAndJoin(e)},');
    }
    finalOutput.writeln('}\n');
  }

  // //radius Enums
  // if (radiusExists) {
  //   final enumName = formatGSEnumName(mapName.replaceFirst('Data', 'Radius'));
  //   finalOutput.writeln('enum $enumName {');
  //   radius.forEach((e) => finalOutput.writeln('\$$e,'));
  //   finalOutput.writeln('}\n');
  // }

  writeToFile('./enums.dart', finalOutput.toString());
}

void writeToFile(String filePath, String data) {
  File file = File(filePath);

  file
      .writeAsString(data)
      .then((_) => {
            // print('Data has been written to $filePath'),
          })
      .catchError((error) {
    if (kDebugMode) {
      print('Error writing to file: $error');
    }
    return {};
  });
}

String formatGSEnumName(String input) {
  final output = 'GS${input.split('')[0].toUpperCase()}${input.substring(1)}';
  return output;
}

String capitalizeAndJoin(String input) {
  List<String> words = input.split(" ");
  String firstWord = words[0];
  String capitalizedWords =
      words.skip(1).map((word) => word.capitalize()).join();
  return "$firstWord$capitalizedWords";
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
