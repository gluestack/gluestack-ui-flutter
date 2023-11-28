// import 'dart:io';
// import 'dart:convert';
// import 'package:gluestack_flutter_pro/style/gs_style.dart';
// import 'package:gluestack_flutter_pro/utils/generator/styles_to_be_generated.dart';
// import 'package:dart_style/dart_style.dart';
// import 'package:analyzer/dart/analysis/analysis_context.dart';
// import 'package:analyzer/dart/element/element.dart' as e;
// import 'package:analyzer/dart/element/visitor.dart';
// import 'package:reflectable/mirrors.dart';
// import 'package:reflectable/reflectable.dart';

// void main() async {
//   // initializeReflectable();

//   print('...............Process Started x 2............');
//   String currentDirectory = Directory.current.path;

//   String filePath = '$currentDirectory/generated_gs_style.dart';

//   final visitor = ModelVisitor();

//   StringBuffer generatorBuffer = StringBuffer();
//   //Change incase of project name change or stuff.....
//   generatorBuffer.writeln('''
// import 'package:flutter/material.dart';
// import 'package:gluestack_flutter_pro/style/gs_style.dart';
// //import 'package:gluestack_flutter_pro/style/base_style.dart';
// ''');

//   for (Style style in stylesToBeGenerated) {

//       final instanceMirror = reflector.reflect(GSStyle);
//       final classMirror = instanceMirror.type;

//     generatorBuffer.writeln(
//         """/* $classMirror \n${instanceMirror.type.declarations.keys} */""");
//   }

//   File file = File(filePath);

//   file.writeAsStringSync(generatorBuffer.toString());

//   print('Process........Was.......Completed!');
//   print('Style Generated!! \nAvailable @: ${file.absolute.path} :)');
//   // print('Cross-Verification Path: ${filePath}');
// }

// class ModelVisitor extends SimpleElementVisitor<void> {
//   String className = '';
//   Map<String, dynamic> fields = {};

//   @override
//   void visitConstructorElement(e.ConstructorElement element) {
//     final returnType = element.returnType.toString();
//     className = returnType.replaceFirst('*', '');
//   }

//   @override
//   void visitFieldElement(e.FieldElement element) {
//     fields[element.name] = element.type.toString().replaceFirst('*', '');
//   }
// }

// const reflector = const Reflector();

// class Reflector extends Reflectable {
//   const Reflector() : super(invokingCapability);
// }