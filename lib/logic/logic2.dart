import 'dart:convert';

// import 'package:gluestack_ui/src/utils/resolver.dart';

bool isRootClass = true;
String baseClassName = '';

const ignoreGsStuff = <String>{
  //GSActions
  "primary",
  "secondary",
  "positive",
  "negative",
  "defaultStyle",
  "error",
  "warning",
  "success",
  "info",
  "muted",
  "attention",
  "underlined",
  "outline",
  "rounded",
  "solid",
  "link",
  "accent",
  'text', 'icon', 'dark', 'spinner', 'props', 'active', 'hover',
  "xs",
  "sm",
  "md",
  "lg",
  "xl",
  "2xs",
  "2xl",
  "3xl",
  "4xl",
  "5xl",
  "6xl",
  "full",
  "compoundvariants", "value", "web", "focusvisible", "disabled",
  "badge", "image", "defaultprops", "modxl"
};

String generateCode(String input, String className) {
  final buffer = StringBuffer()..writeln();
  final generatedClasses = <String>{};
  isRootClass = true;
  Map<String, dynamic> json = jsonDecode(input) as Map<String, dynamic>;
  baseClassName = _capitalize(className);
  _generateModel(buffer, _capitalize(className), json, generatedClasses);

  baseClassName = '';
  return buffer.toString();
}

void _generateModel(
  StringBuffer buffer,
  String className,
  Map<String, dynamic> jsonMap,
  Set<String> generatedClasses,
) {
  if (generatedClasses.contains(className)) return;
  if (ignoreGsStuff.contains(className.toLowerCase())) return;
  bool ignoreEOF = false;

  generatedClasses.add(className);
  if (isRootClass) {
    buffer
        .writeln(""" import 'package:gluestack_ui/src/style/gs_style.dart';""");
    // buffer.writeln("""import 'package:flutter/material.dart';\n""");
    ignoreEOF = true;
    // buffer.writeln('class $className extends GSStyle {');

    isRootClass = false;
  } else {
    if (className == 'Variants') {
      ignoreEOF = true;
      // buffer.writeln('class $baseClassName$className extends Variants {');
    } else if (className == 'Action') {
      buffer.writeln('class $baseClassName$className extends GSAction {');
    } else if (className == 'Variant') {
      buffer.writeln('class $baseClassName$className extends GSVariant {');
    } else if (className == 'Size') {
      buffer.writeln('class $baseClassName$className extends GSSize {');
    } else {
      buffer.writeln('class $className {');
    }
  }

  jsonMap = sanitize(jsonMap);

  buffer.writeln();
  buffer.writeln();

  // if (className == 'Action' || className == 'Variant') {
  // Getters ====================================================
  if (className == 'Action' || className == 'Variant') {
    buffer.writeAll(
      jsonMap.entries.map((e) {
        //TODO: try to reduce computation here
        return '${findGsPropIndex(e.key) != -1 ? '@override\n' : ''}GSStyle? get ${e.key} => GSStyle.fromMap(data: ${jsonEncode(e.value).replaceAll('\$', '\\\$')});';
      }),
    );
  } else if (className == 'Size') {
    buffer.writeAll(
      jsonMap.entries.map((e) {
        //TODO: try to reduce computation here
        return '${findGsPropIndex(e.key) != -1 ? '@override\n' : ''}GSStyle? get \$${e.key} => GSStyle.fromMap(data: ${jsonEncode(e.value).replaceAll('\$', '\\\$')});';
      }),
    );
  }
  // }
//   else {
//     //Class Props ====================================================

//     jsonMap.forEach((key, dynamic value) {
//       String type = _getType(value, key);

//       //To override existing with proprer type and conversion - resolver
//       int index = findGsPropIndex(key);
// //TODO: try to remove this
//       //key -> var name
//       if (index != -1) {
//         //found
//         buffer.writeln(' @override');
//         buffer.writeln('   ${gsStyleProps[index].type} $key;');

//         // buffer.writeln('  final ${gsStyleProps[index].type} $key;');
//       } else {
//         buffer.writeln('   $type? $key;');
//         // buffer.writeln('  final $type? $key;');
//       }
//     });

//     // Constructor  ====================================================
//     buffer.writeln();
//     //Const Name

//     buffer.writeln('  $className({');

//     buffer.writeAll(
//       jsonMap.entries.map(
//         (e) {
//           final type = _getType(e.value, e.key);

//           final defaultValueString =
//               _getDefaultValueString(e.key, e.value, type);
//           return 'this.${e.key} $defaultValueString, '; // = coming from defValStr, no need to handle here
//         },
//       ),
//     );
//     buffer.writeln('});');
//   }
  if (!ignoreEOF) {
    buffer.writeln('}'); //EOF
  }

//handle nested stuff recusively
  jsonMap.forEach((key, dynamic value) {
    if (value is Map<String, dynamic>) {
      _generateModel(buffer, _getType(value, key), value, generatedClasses);
    } else if (value is List) {
      if (value.isNotEmpty && value.first is Map) {
        _generateModel(
          buffer,
          _getType(value.first, key),
          value.first as Map<String, dynamic>,
          generatedClasses,
        );
      }
      for (final element in value) {
        if (element is Map<String, dynamic>) {
          _generateModel(
            buffer,
            _getType(element, key),
            element,
            generatedClasses,
          );
        }
      }
    }
  });
}

// String gsStyleValueResolver(
//     dynamic sourceType, String targetType, String varName) {
//   if (sourceType is int) {
//     print('s type is int $targetType: $varName');
//   } else if (sourceType is String) {
//     print('s type is String $targetType: $varName');
//   }

//   return 'func';
// }

String _getType(dynamic value, String key) {
  //key -> var Name
  int index = findGsPropIndex(key);
  if (index == 1) {
    //element found in GSStyle, take type from GSStyle
    return gsStyleProps[index].type;
  } else {
    //not found - infer type
    if (value is int) {
      return 'int';
    } else if (value is double) {
      return 'double';
    } else if (value is String) {
      return 'String';
    } else if (value is bool) {
      return 'bool';
    } else if (value is List) {
      if (value.isEmpty) {
        return 'List<dynamic>';
      } else {
        return 'List<${_getType(value.first, key)}>';
      }
    } else if (value is Map) {
      // key = sanitize(key);
      return _capitalize(key);
    } else {
      return 'dynamic';
    }
  }
}

String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

String _getDefaultValueString(String key, dynamic value, String type) {
  //ignore - don't put any value
  if (value is List || value is Map) {
    // return ' = ${jsonEncode(value)}';
    return '';
  }

//Fix - cuz overriding GSStyle ======
  final index = findGsPropIndex(key);
  if (index != -1) {
    //   //found in gsStyle, resolve to correct type
    final gsType = gsStyleProps[index].type;

    print('key: $key | targetType: $type | gsType: $gsType | value: $value');

    // if (key == 'borderRadius') {
    //   return ' = ${resolveSpaceFromString(value.toString())}';
    // } else if (type == 'int' ||
    //     type == 'int?' && gsType == 'double' ||
    //     gsType == 'double?') {
    //   return ' = ${double.tryParse(value.toString())}';
    // } else if (key == 'borderColor' ||
    //     key == 'bg' ||
    //     key == 'color' ||
    //     key == 'backgroundColor') {
    //   return ' = Colors.red ';
    //   // return ' = ${resolveColorFromString(value.toString())} ';
    // } else if (key == 'alignItems' || key == 'justifyContent') {
    //   return ' = ${resolveAlignmentFromString(value.toString())} ';
    // } else if (key == 'flexDirection') {
    //   return ' = ${resolveFlexDirectionFromString(value.toString())}';
    // }
    return ' = "toResolve" ';
  } else {
    var val = value;
//handling string
    if (val is String) {
      val = jsonEncode(value);
      if (val.contains('\$')) {
        val = val.replaceFirst('\$', '\\\$');
      }
    }
    return ' = $val';
  }
}

class GsProp {
  String name;
  String type;
  GsProp({required this.name, required this.type});
}

int findGsPropIndex(String name) {
  for (int i = 0; i < gsStyleProps.length; i++) {
    if (gsStyleProps[i].name == name) {
      return i;
    }
  }
  return -1;
}

List<GsProp> gsStyleProps = [
  GsProp(name: 'borderWidth', type: 'double?'),
  GsProp(name: 'borderColor', type: 'Color?'),
  GsProp(name: 'borderRadius', type: 'double?'),
  GsProp(name: 'padding', type: 'EdgeInsetsGeometry?'),
  GsProp(name: 'margin', type: 'EdgeInsetsGeometry?'),
  GsProp(name: 'opacity', type: 'double?'),
  GsProp(name: 'color', type: 'Color?'),
  GsProp(name: 'bg', type: 'Color?'),
  GsProp(name: 'gap', type: 'double?'),
  GsProp(name: 'borderBottomColor', type: 'Color?'),
  GsProp(name: 'height', type: 'double?'),
  GsProp(name: 'width', type: 'double?'),
  GsProp(name: 'borderBottomWidth', type: 'double?'),
  GsProp(name: 'borderLeftWidth', type: 'double?'),
  GsProp(name: 'textStyle', type: 'TextStyle?'),
  GsProp(name: 'checked', type: 'GSStyle?'),
  // GsProp(name: 'variants', type: 'Variants?'), //TODO: Look into this
  GsProp(name: 'props', type: 'GSProps?'),
  GsProp(name: 'descendantStyles', type: 'Map<String, GSStyle?>?'),
  GsProp(name: 'flexDirection', type: 'GSFlexDirections?'),
  GsProp(name: 'alignItems', type: 'GSAlignments?'),
  GsProp(name: 'justifyContent', type: 'GSAlignments?'),
  GsProp(name: 'maxWidth', type: 'double?'),
  GsProp(name: 'alignment', type: 'AlignmentGeometry?'),
  GsProp(name: 'top', type: 'double?'),
  GsProp(name: 'bottom', type: 'double?'),
  GsProp(name: 'right', type: 'double?'),
  GsProp(name: 'left', type: 'double?'),
  GsProp(name: 'progressValueColor', type: 'Color?'),
  GsProp(name: 'highlightColor', type: 'Color?'),
  GsProp(name: 'splashColor', type: 'Color?'),
  GsProp(name: 'badge', type: 'GSStyle?'),
  GsProp(name: 'textTransform', type: 'GSTextTransform?'),
  GsProp(name: 'iconSize', type: 'GSSizes?'),
  GsProp(name: 'trackColorTrue', type: 'Color?'),
  GsProp(name: 'trackColorFalse', type: 'Color?'),
  GsProp(name: 'thumbColor', type: 'Color?'),
  GsProp(name: 'activeThumbColor', type: 'Color?'),
  GsProp(name: 'iosBackgroundColor', type: 'Color?'),
  GsProp(name: 'scale', type: 'double?'),
  GsProp(name: 'cursors', type: 'GSCursors?'),
  GsProp(name: 'placement', type: 'GSPlacement?'),
  GsProp(name: 'isVisible', type: 'bool?'),
  GsProp(name: 'direction', type: 'Axis?'),
  GsProp(name: 'outlineWidth', type: 'double?'),
  GsProp(name: 'outlineColor', type: 'Color?'),
  GsProp(name: 'outlineStyle', type: 'GSOutlineStyle?'),
  GsProp(name: 'compoundVariants', type: 'Map<String, GSStyle>?'),

  //additional stuff - workaournd
  GsProp(name: 'icon', type: 'GSStyle?'),

  //GSActions - PROP
  GsProp(name: 'primary', type: 'GSStyle?'),
  GsProp(name: 'secondary', type: 'GSStyle?'),
  GsProp(name: 'positive', type: 'GSStyle?'),
  GsProp(name: 'negative', type: 'GSStyle?'),
  GsProp(name: 'defaultStyle', type: 'GSStyle?'),
  GsProp(name: 'error', type: 'GSStyle?'),
  GsProp(name: 'warning', type: 'GSStyle?'),
  GsProp(name: 'success', type: 'GSStyle?'),
  GsProp(name: 'info', type: 'GSStyle?'),
  GsProp(name: 'muted', type: 'GSStyle?'),
  GsProp(name: 'attention', type: 'GSStyle?'),

  //GSVariants - PROP
  GsProp(name: 'underlined', type: 'GSStyle?'),
  GsProp(name: 'outline', type: 'GSStyle?'),
  GsProp(name: 'rounded', type: 'GSStyle?'),
  GsProp(name: 'solid', type: 'GSStyle?'),
  GsProp(name: 'link', type: 'GSStyle?'),
  GsProp(name: 'accent', type: 'GSStyle?'),

  //GSSize - PROP
  GsProp(name: 'xs', type: 'GSStyle?'),
  GsProp(name: 'sm', type: 'GSStyle?'),
  GsProp(name: 'md', type: 'GSStyle?'),
  GsProp(name: 'lg', type: 'GSStyle?'),
  GsProp(name: 'xl', type: 'GSStyle?'),
  GsProp(name: '2xs', type: 'GSStyle?'),
  GsProp(name: '2xl', type: 'GSStyle?'),
  GsProp(name: '3xl', type: 'GSStyle?'),
  GsProp(name: '4xl', type: 'GSStyle?'),
  GsProp(name: '5xl', type: 'GSStyle?'),
  GsProp(name: '6xl', type: 'GSStyle?'),
  GsProp(name: 'full', type: 'GSStyle?'),
];
List<String> reservedKeywords = [
  'abstract',
  'as',
  'assert',
  'async',
  'await',
  'break',
  'case',
  'catch',
  'class',
  'const',
  'continue',
  'covariant',
  'default',
  'deferred',
  'do',
  'dynamic',
  'else',
  'enum',
  'export',
  'extends',
  'extension',
  'external',
  'factory',
  'false',
  'final',
  'finally',
  'for',
  'Function',
  'get',
  'hide',
  'if',
  'implements',
  'import',
  'in',
  'interface',
  'is',
  'late',
  'library',
  'mixin',
  'new',
  'null',
  'on',
  'operator',
  'part',
  'rethrow',
  'return',
  'set',
  'show',
  'static',
  'super',
  'switch',
  'sync',
  'this',
  'throw',
  'true',
  'try',
  'typedef',
  'var',
  'void',
  'while',
  'with',
  'yield',
];
Map<String, dynamic> sanitize(Map<String, dynamic> input) {
  Map<String, dynamic> result = {};

  input.forEach((key, value) {
    // Remove ':' and '_' from the start of keys
    String newKey = key.replaceFirst(RegExp(r'^[:_]+'), '');
    //Check for reserve keywords
    if (reservedKeywords.contains(key)) {
      print(
          'Warning: Key "$newKey" is a reserved keyword and will modified to ensure no conflict.');
      newKey = newKey + 'Mod';
    }
    if (newKey.startsWith(RegExp(r'[0-9]'))) {
      print(
          'Warning: Key "$newKey" starts with a number, which is not allowed, thus it will modified to ensure no conflict.');

      newKey = newKey.replaceFirst(RegExp(r'[0-9]'), 'mod');
    }
    if (value is Map<String, dynamic>) {
      result[newKey] = sanitize(value);
    } else if (value is List) {
      result[newKey] = value.map((e) {
        if (e is Map<String, dynamic>) {
          return sanitize(e);
        } else {
          return e;
        }
      }).toList();
    } else {
      result[newKey] = value;
    }
  });

  return result;
}
