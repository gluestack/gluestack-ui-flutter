import 'package:build/build.dart';
import 'package:gs_generators/src/annotation.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ToStringGenerator extends GeneratorForAnnotation<ToString> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError('Generator cannot target `$element`.',
          todo: 'Make sure the ToString annotation is only used on classes.');
    }

    final ModelVisitor visitor = ModelVisitor();

    element.visitChildren(visitor);

    final buffer = StringBuffer();
    buffer.writeln('// GS - Generated .toString() Method File //');
    // buffer.writeln("part of 'gs_style.dart';\n\n");

    String generateToString = generateToStringMethod(element, visitor);
    buffer.writeln(generateToString);

    return buffer.toString();
  }
}

String generateToStringMethod(Element element, ModelVisitor visitor) {
  String className = visitor.className;
  final buffer = StringBuffer();

  buffer.writeln('String _\$${className}ToString($className instance) => ');

  buffer.write(" ''' ");
  buffer.writeln('$className(');

  // For accessing superclass fields, dark n all
  ClassElement? currentClass = element as ClassElement?;
  while (currentClass != null) {
    for (FieldElement field in currentClass.fields) {
      String prop = field.name;
      String value = "\${instance.$prop}";

      // Props to skip cuz always present
      if (prop == 'runtimeType' || prop == 'hashCode' || prop == 'contextStyles') {
        continue;
      }

      if (prop == 'descendantStyles') {
        buffer.writeln(_formatDescendantStyles());
      } else if (prop.contains('textStyle')) {
        buffer.writeln(_formatTextStyle(prop));
      } else if (prop.contains("\$")) {
        // for gSSize
        buffer.writeln(
          "\\$prop: $value,",
        );
      } else {
        buffer.writeln(
          "$prop: $value,",
        );
      }
    }

    currentClass = currentClass.supertype?.element as ClassElement?;
  }

  buffer.writeln(")''';\n");

  return buffer.toString();
}

String _formatDescendantStyles() {
  return r"""
      descendantStyles: {
      ${instance.descendantStyles != null && instance.descendantStyles!.isNotEmpty
        ? instance.descendantStyles!.entries.map(
            (entry) => '\'${entry.key}\': ${entry.value != null ? entry.value!.toString() : 'null'}',
          ).join(',\n')
        : ''}
    },
    """;
}

// String generateToStringMethod(ModelVisitor visitor) {
//   String className = visitor.className;
//   final buffer = StringBuffer();

//   buffer.writeln('String _\$${className}ToString($className instance) => ');

//   buffer.write(" ''' ");
//   buffer.writeln('$className(');
//   for (int i = 0; i < visitor.fields.length; i++) {
//     String prop = visitor.fields.keys.elementAt(i);
//     String value = "\${instance.$prop}";

//     //TODO: improv: Make more dynamic
//     if (prop.contains('descendantStyles')) {
//       buffer.writeln(r"""
//       descendantStyles: {
//       ${instance.descendantStyles != null && instance.descendantStyles!.isNotEmpty
//         ? instance.descendantStyles!.entries.map(
//             (entry) => '\'${entry.key}\': ${entry.value != null ? entry.value!.toString() : 'null'}',
//           ).join(',\n')
//         : ''}
//     },
//     """);
//     } else if (prop.contains('textStyle')) {
//       buffer.writeln(_formatTextStyle(prop));
//     } else if (prop.contains("\$")) {
//       //for gSSize
//       buffer.writeln(
//         "\\$prop: $value,",
//       );
//     } else {
//       buffer.writeln(
//         "$prop: $value,",
//       );
//     }
//   }
//   buffer.writeln(")''';\n");

//   return buffer.toString();
// }

class ModelVisitor extends SimpleElementVisitor<void> {
  String className = '';
  Map<String, dynamic> fields = {};

  @override
  void visitConstructorElement(ConstructorElement element) {
    final String returnType = element.returnType.toString();
    className = returnType.replaceAll("*", "");
  }

  @override
  void visitFieldElement(FieldElement element) {
    String elementType = element.type.toString().replaceAll("*", "");
    fields[element.name] = elementType;
  }
}

String _formatTextStyle(String name) {
  return '''
      $name: TextStyle(
        color: \${instance.textStyle?.color},
        fontSize: \${instance.textStyle?.fontSize},
        fontWeight: \${instance.textStyle?.fontWeight},
        fontStyle: \${instance.textStyle?.fontStyle},
        letterSpacing: \${instance.textStyle?.letterSpacing},
        wordSpacing: \${instance.textStyle?.wordSpacing},
        height: \${instance.textStyle?.height},
        backgroundColor: \${instance.textStyle?.backgroundColor},
        decoration: \${instance.textStyle?.decoration},
        decorationColor: \${instance.textStyle?.decorationColor},
        decorationStyle: \${instance.textStyle?.decorationStyle},
        decorationThickness: \${instance.textStyle?.decorationThickness},
        textBaseline: \${instance.textStyle?.textBaseline},
        fontFamily: \${instance.textStyle?.fontFamily},
        fontFamilyFallback: \${instance.textStyle?.fontFamilyFallback},
        locale: \${instance.textStyle?.locale},
        foreground: \${instance.textStyle?.foreground},
      ),
    ''';
  //removing:| inherit: ${value.inherit}, |cuz it's always true, cuz TS always needs to inherit only
}
