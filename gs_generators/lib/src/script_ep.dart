// import 'package:build/build.dart';
// import 'package:build_runner/build_runner.dart';
// import 'package:source_gen/source_gen.dart';

// void main(List<String> args) {
//   var phases = [
//     // Add any other builders you need here
//     // e.g., if you're using json_serializable, add:
//     // JsonSerializableGenerator(),
//     MyScriptBuilder(),
//   ];

//   run(args, phases);
// }

// class MyScriptBuilder implements Builder {
//   @override
//   List<BuildAction> get buildActions => [
//         BuildAction(
//           MyScriptBuilderImpl(),
//           'my_script_builder',
//           inputs: ['lib/style/script_test/styles_to_be_generated.dart'],
//         ),
//       ];
// }

// class MyScriptBuilderImpl extends Builder {
//   @override
//   Future<void> build(BuildStep buildStep) async {
//     // Run your Dart script here
//     print('Running My Script...');
//     // Call your main() function or load your script and run it here
//   }

//   @override
//   Map<String, List<String>> get buildExtensions => {
//         '.dart': ['.dart']
//       };
// }
