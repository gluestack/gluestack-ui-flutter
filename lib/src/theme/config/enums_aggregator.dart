import 'dart:io';

import 'package:flutter/foundation.dart';

void main() {
  try {
    final file = File('enums.dart');
    final lines = file.readAsLinesSync();

    final variantEnums = <String>{};
    final actionEnums = <String>{};
    final sizeEnums = <String>{};
    final spaceEnums = <String>{};
    final placementEnums = <String>{};

    sizeEnums.addAll(extractEnums(lines, 'Sizes'));
    actionEnums.addAll(extractEnums(lines, 'Actions'));
    variantEnums.addAll(extractEnums(lines, 'Variants'));
    spaceEnums.addAll(extractEnums(lines, 'Spaces'));
    placementEnums.addAll(extractEnums(lines, 'Placements'));

    final content = '''
enum GSVariants {
  ${variantEnums.join(',\n  ')}
}

enum GSActions {
  ${actionEnums.join(',\n  ')}
}

enum GSSizes {
  ${sizeEnums.join(',\n  ')}
}

enum GSSpaces {
  ${spaceEnums.join(',\n  ')}
}

enum GSPlacements {
  ${placementEnums.join(',\n  ')}
}
''';

    File('base_enums.dart').writeAsStringSync(content);

    if (kDebugMode) {
      print('Enums merged and saved to base_enums.dart successfully!');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error: $e');
    }
  }
}

List<String> extractEnums(List<String> lines, String target) {
  List<String> enums = [];
  List<int> lineNos = [];
  bool checkNext = false;
  for (int i = 0; i < lines.length; i++) {
    if (lines[i].startsWith('enum ') && lines[i].contains(target)) {
      checkNext = true;
      continue;
    }
    if (lines[i].contains('}')) {
      checkNext = false;
      continue;
    }
    if (checkNext) {
      lineNos.add(i);
    }
  }

  for (int i = 0; i < lineNos.length; i++) {
    enums.add(lines[lineNos[i]].split(',')[0]);
    // print(enums.last);
  }

  return enums;
}
