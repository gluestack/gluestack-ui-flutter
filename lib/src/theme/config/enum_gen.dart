import 'dart:convert';
import 'dart:io';

StringBuffer finalOutput = StringBuffer();

void main() {
  final currentDirectory = Directory.current;
  crawlDirectory(currentDirectory);
  // readFile(File('./button/button.dart'));
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
      if (mapData != null
          //  && mapData.contains('"variants"')
          ) {
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

        if (variants is Map<String, dynamic>) {
          generateEnum(mapName ?? 'DebugErrorValue-CheckScript', variants);
        }
      }
    }
  } catch (e) {
    print('Error parsing file ${file.path}: $e');
  }
}

void generateEnum(String mapName, Map<String, dynamic> variants) {
  bool sizeExists = false;
  bool actionsExists = false;
  bool variantsExists = false;
  bool spaceExists = false;
  List<String> variantsList = [];
  List<String> sizes = [];
  List<String> actions = [];
  List<String> spaces = [];

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
  });

  //variants

  if (variantsExists) {
    String enumName = mapName.replaceFirst('Data', 'Variants');
    finalOutput.writeln('enum $enumName {');
    variantsList.forEach((e) => finalOutput.writeln('$e,'));
    finalOutput.writeln('}\n');
  }

  //Action Enums
  if (actionsExists) {
    String enumName = mapName.replaceFirst('Data', 'Actions');

    finalOutput.writeln('enum $enumName {');
    actions.forEach((e) => finalOutput.writeln('$e,'));

    finalOutput.writeln('}\n');
  }

  //size Enums
  if (sizeExists) {
    String enumName = mapName.replaceFirst('Data', 'Sizes');

    finalOutput.writeln('enum $enumName {');
    sizes.forEach((e) => finalOutput.writeln('$e,'));
    finalOutput.writeln('}\n');
  }

  //space Enums
  if (spaceExists) {
    String enumName = mapName.replaceFirst('Data', 'Spaces');

    finalOutput.writeln('enum $enumName {');
    spaces.forEach((e) => finalOutput.writeln('$e,'));
    finalOutput.writeln('}\n');
  }

  writeToFile('./output.txt', finalOutput.toString());
}

void writeToFile(String filePath, String data) {
  File file = File(filePath);

  file
      .writeAsString(data)
      .then((_) => print('Data has been written to $filePath'))
      .catchError((error) => print('Error writing to file: $error'));
}
