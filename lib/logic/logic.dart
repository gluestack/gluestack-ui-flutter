// import 'dart:convert';

// String generateCode(String input, String className) {
//   final buffer = StringBuffer()..writeln();
//   final generatedClasses = <String>{};

//   Map<String, dynamic> json = jsonDecode(input) as Map<String, dynamic>;

//   _generateModel(buffer, _capitalize(className), json, generatedClasses);

//   return buffer.toString();
// }

// void _generateModel(
//   StringBuffer buffer,
//   String className,
//   Map<String, dynamic> jsonMap,
//   Set<String> generatedClasses,
// ) {
//   if (generatedClasses.contains(className)) return;

//   generatedClasses.add(className);

//   buffer.writeln('class $className {');

//   jsonMap = sanitize(jsonMap);

//   jsonMap.forEach((key, dynamic value) {
//     final type = _getType(value, key);
//     // key = sanitize(key);
//     buffer.writeln('  final $type? $key;');
//   });

//   // Unnamed constructor
//   buffer
//     ..writeln()
//     ..writeln('  $className({')
//     ..writeAll(jsonMap.entries.map((e) => 'this.${e.key}, '))
//     ..writeln('});')
//     ..writeln()

//     // fromJson factory method
//     ..writeln()
//     ..writeln('  factory $className.fromJson(Map<String, dynamic> json) {')
//     ..writeln('    return $className(')
//     ..writeAll(
//       jsonMap.entries.map((e) {
//         final type = _getType(e.value, e.key);
//         if (type.startsWith('List<')) {
//           return "      ${e.key}: (json['${e.key}'] as List<dynamic>?)?.map((e) => ${type.substring(5, type.length - 1)}.fromJson(e as Map<String, dynamic>)).toList(),";
//         } else if (e.value is Map) {
//           return "      ${e.key}: json['${e.key}'] !=null ? ${_getType(e.value, e.key)}.fromJson(json['${e.key}'] as Map<String, dynamic>) : null,";
//         } else {
//           return "      ${e.key}: json['${e.key}'] != null ? json['${e.key}'] as ${_getType(e.value, e.key)}? : null,";
//         }
//       }),
//     )
//     ..writeln('    );')
//     ..writeln('  }')

//     // toJson method
//     ..writeln()
//     ..writeln('  Map<String, dynamic> toJson() {')
//     ..writeln('    return {')
//     ..writeAll(
//       jsonMap.entries.map((e) {
//         final type = _getType(e.value, e.key);
//         if (type.startsWith('List<')) {
//           return "      '${e.key}': ${e.key}?.map((e) => e.toJson()).toList(),";
//         } else if (e.value is Map) {
//           return "      '${e.key}': ${e.key}?.toJson(),";
//         } else {
//           return "      '${e.key}': ${e.key},";
//         }
//       }),
//     )
//     ..writeln('    };')
//     ..writeln('  }')
//     ..writeln('}');

//   jsonMap.forEach((key, dynamic value) {
//     if (value is Map<String, dynamic>) {
//       _generateModel(buffer, _getType(value, key), value, generatedClasses);
//     } else if (value is List) {
//       if (value.isNotEmpty && value.first is Map) {
//         _generateModel(
//           buffer,
//           _getType(value.first, key),
//           value.first as Map<String, dynamic>,
//           generatedClasses,
//         );
//       }
//       for (final element in value) {
//         if (element is Map<String, dynamic>) {
//           _generateModel(
//             buffer,
//             _getType(element, key),
//             element,
//             generatedClasses,
//           );
//         }
//       }
//     }
//   });
// }

// String _getType(dynamic value, String key) {
//   if (value is int) {
//     return 'int';
//   } else if (value is double) {
//     return 'double';
//   } else if (value is String) {
//     return 'String';
//   } else if (value is bool) {
//     return 'bool';
//   } else if (value is List) {
//     if (value.isEmpty) {
//       return 'List<dynamic>';
//     } else {
//       return 'List<${_getType(value.first, key)}>';
//     }
//   } else if (value is Map) {
//     // key = sanitize(key);
//     return _capitalize(key);
//   } else {
//     return 'dynamic';
//   }
// }

// String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

// List<String> reservedKeywords = [
//   'abstract',
//   'as',
//   'assert',
//   'async',
//   'await',
//   'break',
//   'case',
//   'catch',
//   'class',
//   'const',
//   'continue',
//   'covariant',
//   'default',
//   'deferred',
//   'do',
//   'dynamic',
//   'else',
//   'enum',
//   'export',
//   'extends',
//   'extension',
//   'external',
//   'factory',
//   'false',
//   'final',
//   'finally',
//   'for',
//   'Function',
//   'get',
//   'hide',
//   'if',
//   'implements',
//   'import',
//   'in',
//   'interface',
//   'is',
//   'late',
//   'library',
//   'mixin',
//   'new',
//   'null',
//   'on',
//   'operator',
//   'part',
//   'rethrow',
//   'return',
//   'set',
//   'show',
//   'static',
//   'super',
//   'switch',
//   'sync',
//   'this',
//   'throw',
//   'true',
//   'try',
//   'typedef',
//   'var',
//   'void',
//   'while',
//   'with',
//   'yield',
// ];
// Map<String, dynamic> sanitize(Map<String, dynamic> input) {
//   Map<String, dynamic> result = {};

//   input.forEach((key, value) {
//     // Remove ':' and '_' from the start of keys
//     String newKey = key.replaceFirst(RegExp(r'^[:_]+'), '');
//     //Check for reserve keywords
//     if (reservedKeywords.contains(key)) {
//       print(
//           'Warning: Key "$newKey" is a reserved keyword and will modified to ensure no conflict.');
//       newKey = newKey + 'Mod';
//     }
//     if (newKey.startsWith(RegExp(r'[0-9]'))) {
//       print(
//           'Warning: Key "$newKey" starts with a number, which is not allowed, thus it will modified to ensure no conflict.');

//       newKey = newKey.replaceFirst(RegExp(r'[0-9]'), 'mod');
//     }
//     if (value is Map<String, dynamic>) {
//       result[newKey] = sanitize(value);
//     } else if (value is List) {
//       result[newKey] = value.map((e) {
//         if (e is Map<String, dynamic>) {
//           return sanitize(e);
//         } else {
//           return e;
//         }
//       }).toList();
//     } else {
//       result[newKey] = value;
//     }
//   });

//   return result;
// }
