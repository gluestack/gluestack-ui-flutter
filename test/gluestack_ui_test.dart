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

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

void main() {
  testWidgets('GSBox Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      GluestackProvider(
        child: MaterialApp(
          home: Scaffold(
            body: GSBox(
              style: GSStyle(
                bg: Colors.blue,
                borderRadius: 10.0,
                borderWidth: 2.0,
                borderColor: Colors.black,
              ),
              clipBehavior: Clip.none,
              shape: BoxShape.rectangle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                  offset: Offset(0, 2),
                ),
              ],
              child: const Text('Test Widget'),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Test Widget'), findsOneWidget);
    expect(find.byType(GSBox), findsOneWidget);
    expect(find.byWidgetPredicate((widget) {
      if (widget is Container) {
        BoxDecoration decoration = widget.decoration as BoxDecoration;
        return decoration.color == Colors.blue &&
            decoration.borderRadius == BorderRadius.circular(10.0) &&
            decoration.border?.top.width == 2.0 &&
            decoration.border?.top.color == Colors.black &&
            decoration.boxShadow?.length == 1 &&
            decoration.boxShadow?[0].color == Colors.grey;
      }
      return false;
    }), findsOneWidget);
  });

  testWidgets('GSBox Widget Test with Rounded Corners',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GSBox(
            style: GSStyle(
              bg: Colors.red,
              borderRadius: 20.0,
            ),
            child: const Text('Test Widget'),
          ),
        ),
      ),
    );

    expect(find.byWidgetPredicate((widget) {
      if (widget is Container) {
        BoxDecoration decoration = widget.decoration as BoxDecoration;
        return decoration.borderRadius == BorderRadius.circular(20.0);
      }
      return false;
    }), findsOneWidget);
  });

  testWidgets('GSBox Widget Test with No Child', (WidgetTester tester) async {
    // Build our widget with no child
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GSBox(),
        ),
      ),
    );

    // Verify that the GSBox widget has no child
    expect(find.byType(Text), findsNothing);
  });

  testWidgets('GSInput Widget Test', (WidgetTester tester) async {
    // Build our widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GSInput(
            hintText: 'Enter your text here',
            style: GSStyle(
              textStyle: const TextStyle(fontSize: 16),
            ),
            onChanged: (value) {
              // Do something with the changed value
            },
          ),
        ),
      ),
    );

    // Find the GSInput widget
    final gsInputFinder = find.byType(GSInput);

    // Verify that GSInput widget is rendered
    expect(gsInputFinder, findsOneWidget);

    // Verify that the hint text is displayed
    expect(find.text('Enter your text here'), findsOneWidget);

    // // Tap on the GSInput widget
    // await tester.tap(gsInputFinder);
    // await tester.pump();
  });

  testWidgets('GSInput Widget Focus Test', (WidgetTester tester) async {
    const Key key = ValueKey<String>('TextField');
    final FocusNode focusNode = FocusNode();
    // Build our widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GSInput(
            key: key,
            focusNode: focusNode,
            hintText: 'Enter your text here',
            style: GSStyle(
              textStyle: const TextStyle(fontSize: 16),
            ),
            onChanged: (value) {
              // Do something with the changed value
            },
          ),
        ),
      ),
    );

    // Ensure the input field is not focused initially
    expect(FocusManager.instance.primaryFocus, isNot(find.byType(GSInput)));

    // Tap on the input field to give it focus
    await tester.tap(find.byType(GSInput));
    await tester.pump();

    // Ensure the input field is focused after tapping
    expect(FocusManager.instance.primaryFocus, findsOneWidget);
    expect(FocusManager.instance.primaryFocus!.context, isA<GSInput>());
  });

  testWidgets('GSAvatar Widget Test', (WidgetTester tester) async {
    // Build the GSAvatar widget
    await tester.pumpWidget(
      GluestackProvider(
        child: MaterialApp(
          home: Scaffold(
            body: GSAvatar(
              size: GSAvatarSizes.$md,
              radius: GSAvatarRadius.$md,
              fallBackText: const GSAvatarFallBackText('Fallback'),
              backgroundImage: const AssetImage('assets/background_image.png'),
              foregroundImage: const AssetImage('assets/foreground_image.png'),
              onBackgroundImageError:
                  (dynamic exception, StackTrace? stackTrace) {},
              onForegroundImageError:
                  (dynamic exception, StackTrace? stackTrace) {},
              avatarImage: const GSImage(
                  path: 'assets/avatar_image.png',
                  imageType: GSImageType.asset),
              avatarBadge: const GSAvatarBadge(),
            ),
          ),
        ),
      ),
    );

    // Verify that the GSAvatar widget is rendered
    expect(find.byType(GSAvatar), findsOneWidget);
    //expect(find.text('Fallback'), findsOneWidget);
    expect(find.byType(GSImage), findsOneWidget);
    expect(find.text('Badge'), findsOneWidget);
  });
}
