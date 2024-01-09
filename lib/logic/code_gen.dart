import 'dart:io';
import '/logic/logic2.dart';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as p;

class YamlException implements Exception {}

class NoSourceFilesException implements Exception {}

class NoSrcDirException implements Exception {}

class NoOutputDirException implements Exception {}

Future<void> main({Map? config}) async {
  late final Directory sourceDirectory;
  late final Directory outputDirectory;

  File yamlFile = File("pubspec.yaml");
  final yamlString = yamlFile.readAsStringSync();
  Map yaml = (config != null) ? config : loadYaml(yamlString);

  final codeGen = yaml['codeGen'];
  try {
    sourceDirectory = Directory(codeGen['src']);
    outputDirectory = Directory(codeGen['out']);
  } catch (_) {
    throw YamlException();
  }

  // Exception Handling
  if (!sourceDirectory.existsSync()) {
    throw NoSrcDirException();
  }
//No need as forcing to create new dir
  // if (!outputDirectory.existsSync()) {
  //   throw NoOutputDirException();
  // }

  final jsonFiles = sourceDirectory.listSync(followLinks: false);

  if (jsonFiles.isNotEmpty) {
    for (final jsonFile in jsonFiles) {
      final name = p.basenameWithoutExtension(jsonFile.path);
      if (p.extension(jsonFile.path) == ".json") {
        // print('-------');

        final jsonString =
            File('${codeGen['src']}/$name.json').readAsStringSync();

        final generatedClassCode = generateCode(jsonString, name);

        final outputPath = './lib/models/${name}_model.dart';
        final output = await File(outputPath).create(recursive: true);

        //meta data
        final String meta =
            "//////==== AUTO GENERATED ON: ${DateTime.now().toString()} ===////";

        //write to file
        output.writeAsString('$meta\n$generatedClassCode');
      }
    }
  } else {
    throw NoSourceFilesException();
  }
}
