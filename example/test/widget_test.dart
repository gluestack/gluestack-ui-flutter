// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

import 'package:gluestack_ui_example/main.dart';

void main() {
  Widget testFrame(Widget child) {
    return GluestackProvider(
      child: MaterialApp(
        home: child,
      ),
    );
  }

//============= GS BUTTON TEST CASES ==============================

//Test: Test single button tap
  testWidgets('Test button tap', (WidgetTester tester) async {
    bool tapped = false;

    // Build the widget
    await tester.pumpWidget(
      testFrame(
        GSButton(
          child: const GSText(
            text: 'GSButton',
          ),
          onPressed: () {
            tapped = true;
          },
        ),
      ),
    );

    await tester.tap(find.text('GSButton'));
    await tester.pump();

    expect(tapped, true);
  });

//Test: Test double button tap
  testWidgets('Test double button tap', (WidgetTester tester) async {
    bool doubleTapped = false;
    int count = 0;

    // Build the widget
    await tester.pumpWidget(
      testFrame(
        GSButton(
          child: const GSText(
            text: 'GSButton',
          ),
          onPressed: () {
            count++;
            if (count == 2) {
              doubleTapped = true;
            }
          },
        ),
      ),
    );

    await tester.tap(find.text('GSButton'));
    await tester.tap(find.text('GSButton'));
    await tester.pump();

    expect(doubleTapped, true);
  });

//Test: Test long press
  testWidgets('Test long press', (WidgetTester tester) async {
    bool longPressed = false;

    // Build the widget
    await tester.pumpWidget(
      testFrame(
        GSButton(
          child: const GSText(
            text: 'GSButton',
          ),
          onPressed: () {},
          onLongPress: () {
            longPressed = true;
          },
        ),
      ),
    );

    await tester.longPress(find.text('GSButton'));
    await tester.pump();

    expect(longPressed, true);
  });

//Test: Test Color Prop
  testWidgets('Test Color Prop', (WidgetTester tester) async {
    await tester.pumpWidget(
      testFrame(
        GSButton(
          style: GSStyle(bg: Colors.red),
          onPressed: () {},
          child: const GSText(
            text: 'GSButton',
          ),
        ),
      ),
    );

    await tester.pump();
    expect(
      tester
          .widget<GSButton>(
            find.widgetWithText(GSButton, 'GSButton'),
          )
          .style
          ?.bg,
      Colors.red,
    );
  });

//Test: Test Variant + Size + Actions Test
  testWidgets('Test Button Variant + Size + Actions',
      (WidgetTester tester) async {
    const List<GSButtonVariants?> variants = [
      null,
      GSButtonVariants.solid,
      GSButtonVariants.outline,
      GSButtonVariants.link
    ];

    const List<GSButtonActions?> actions = [
      null,
      GSButtonActions.primary,
      GSButtonActions.secondary,
      GSButtonActions.positive,
      GSButtonActions.negative,
    ];

    const List<GSButtonSizes?> sizes = [
      null,
      GSButtonSizes.$xs,
      GSButtonSizes.$sm,
      GSButtonSizes.$md,
      GSButtonSizes.$lg,
    ];

    for (int i = 0; i < variants.length; i++) {
      for (int j = 0; j < actions.length; j++) {
        for (int k = 0; k < sizes.length; k++) {
          await tester.pumpWidget(
            testFrame(
              GSButton(
                variant: variants[i],
                action: actions[j],
                size: sizes[k],
                onPressed: () {},
                child: const GSText(
                  text: 'GSButton',
                ),
              ),
            ),
          );

          await tester.pump();
          //GSVaraiant
          expect(
            tester
                .widget<GSButton>(
                  find.widgetWithText(GSButton, 'GSButton'),
                )
                .variant,
            variants[i],
          );
          //GSAction
          expect(
            tester
                .widget<GSButton>(
                  find.widgetWithText(GSButton, 'GSButton'),
                )
                .action,
            actions[j],
          );

          //GSSizes
          expect(
            tester
                .widget<GSButton>(
                  find.widgetWithText(GSButton, 'GSButton'),
                )
                .size,
            sizes[k],
          );
        }
      }
    }
  });

//Test: Test Button Hover Color
  testWidgets('Test button hover color', (WidgetTester tester) async {
    final button = GSButton(
      onPressed: () {},
      child: const GSText(
        text: 'GSButton',
      ),
    );

    //Simulate hover
    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);

    await tester.pumpWidget(
      testFrame(button),
    );

    await tester.pump();

    final internalButtonContainer = find
        .descendant(
          of: find.byWidget(button),
          matching: find.byType(Container),
        )
        .evaluate()
        .first
        .widget as Container;

    final btnClr = (internalButtonContainer.decoration as BoxDecoration).color;

    // print("Current Button Color: $btnClr");
    // print("Expected bg (base clr): ${$GSColors.primary500}");
    // print("Expected bg (on hover clr): ${$GSColors.primary600}");

    expect(btnClr, $GSColors.primary600);

    await gesture.removePointer();
  });

//Test: Test Button Selection Color
  testWidgets('Test button slection color', (WidgetTester tester) async {
    final button = GSButton(
      onPressed: () {},
      child: const GSText(
        text: 'GSButton',
      ),
    );

    //Simulate hover
    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);

    await tester.pumpWidget(
      testFrame(button),
    );

    await tester.pump();

    await gesture.down(Offset.zero);

    await tester.pumpAndSettle();


    final internalButtonContainer = find
        .descendant(
          of: find.byWidget(button),
          matching: find.byType(Container),
        )
        .evaluate()
        .first
        .widget as Container;

    final btnClr = (internalButtonContainer.decoration as BoxDecoration).color;

    // print("Current Button Color: $btnClr");
    // print("Expected bg (base clr): ${$GSColors.primary500}");
    // print("Expected bg (hover clr): ${$GSColors.primary600}");
    // print("Expected bg (selection clr): ${$GSColors.primary700}");


    await gesture.removePointer();
    await tester.binding.idle();

    //Hacky fix for timer pending error TODO: Try to find a workaround
    await tester.binding.delayed(const Duration(days: 999));
    expect(btnClr, $GSColors.primary700);

  });

// -----------------------------------------------------
  testWidgets('Verify Platform version', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that platform version is retrieved.
    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is Text && widget.data!.startsWith('Running on:'),
      ),
      findsOneWidget,
    );
  });
}
