// import 'package:flutter_test/flutter_test.dart';
// import 'package:gluestack_ui/gluestack_ui.dart';
// import 'package:gluestack_ui/gluestack_ui_platform_interface.dart';
// import 'package:gluestack_ui/gluestack_ui_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockGluestackUiPlatform
//     with MockPlatformInterfaceMixin
//     implements GluestackUiPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final GluestackUiPlatform initialPlatform = GluestackUiPlatform.instance;

//   test('$MethodChannelGluestackUi is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelGluestackUi>());
//   });

//   test('getPlatformVersion', () async {
//     GluestackUi gluestackUiPlugin = GluestackUi();
//     MockGluestackUiPlatform fakePlatform = MockGluestackUiPlatform();
//     GluestackUiPlatform.instance = fakePlatform;

//     expect(await gluestackUiPlugin.getPlatformVersion(), '42');
//   });
// }
