import 'package:flutter/material.dart';
import 'package:gluestack_ui_example/home.dart';
import 'package:gluestack_ui_example/widgets/components/widgets/accordian_example.dart';
import 'package:gluestack_ui_example/widgets/components/widgets/bottom_sheet_example.dart';
import 'package:gluestack_ui_example/widgets/components/widgets/navigation_rail_example.dart';
import 'package:gluestack_ui_example/widgets/storybook/storybook.dart';
import 'package:gluestack_ui_example/widgets/storybook/storybook_wrapper.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/accordion_default_value_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/accordion_disabled_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/accordion_with_rounded_corners.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/nested_accordion_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/stepper_example.dart';
import 'package:go_router/go_router.dart';

import '../widgets/components/widgets/public.dart';
import '../widgets/storybook/widgets/public.dart';

late Function updaterFunc;

GoRouter ree(Function input) {
  updaterFunc = input;
  return router;
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage(updaterFunc: updaterFunc);
      },
      routes: <RouteBase>[
        GoRoute(
          path: "storybook",
          builder: (BuildContext context, GoRouterState state) {
            return const StorybookWidget();
          },
        ),
        GoRoute(
          path: "example-alert",
          builder: (context, state) => const AlertExample(),
        ),
        GoRoute(
          path: "example-avatar",
          builder: (context, state) => const AvatarExample(),
        ),
        GoRoute(
          path: "example-badge",
          builder: (context, state) => const BadgeExample(),
        ),
        GoRoute(
          path: "example-button",
          builder: (context, state) => const ButtonExample(),
        ),
        GoRoute(
          path: "example-center",
          builder: (context, state) => const CenterExample(),
        ),
        GoRoute(
          path: "example-checkbox",
          builder: (context, state) => const CheckBoxExample(),
        ),
        GoRoute(
          path: "example-divider",
          builder: (context, state) => const DividerExample(),
        ),
        GoRoute(
          path: "example-fab",
          builder: (context, state) => const FabExample(),
        ),
        GoRoute(
          path: "example-flex",
          builder: (context, state) => const FlexExample(),
        ),
        GoRoute(
          path: "example-form",
          builder: (context, state) => const FormExample(),
        ),
        GoRoute(
          path: "example-heading",
          builder: (context, state) => const HeadingExample(),
        ),
        GoRoute(
          path: "example-hstack",
          builder: (context, state) => const HStackExample(),
        ),
        GoRoute(
          path: "example-icon",
          builder: (context, state) => const IconExample(),
        ),
        GoRoute(
          path: "example-image",
          builder: (context, state) => const ImageExample(),
        ),
        GoRoute(
          path: "example-input",
          builder: (context, state) => const InputExample(),
        ),
        GoRoute(
          path: "example-link",
          builder: (context, state) => const LinkExample(),
        ),
        GoRoute(
          path: "example-pressable",
          builder: (context, state) => const PressableExample(),
        ),
        GoRoute(
          path: "example-progress",
          builder: (context, state) => const ProgressExample(),
        ),
        GoRoute(
          path: "example-radio_button",
          builder: (context, state) => const RadioButtonExample(),
        ),
        GoRoute(
          path: "example-spinner",
          builder: (context, state) => const SpinnerExample(),
        ),
        GoRoute(
          path: "example-switch",
          builder: (context, state) => const SwitchExample(),
        ),
        GoRoute(
          path: "example-text_area",
          builder: (context, state) => const TextAreaExample(),
        ),
        GoRoute(
          path: "example-text",
          builder: (context, state) => const TextExample(),
        ),
        GoRoute(
          path: "example-toast",
          builder: (context, state) => const ToastExample(),
        ),
        GoRoute(
          path: "example-vstack",
          builder: (context, state) => const VStackExample(),
        ),
        GoRoute(
          path: "example-stack",
          builder: (context, state) => const StackExample(),
        ),
        GoRoute(
          path: "example-scroll",
          builder: (context, state) => const ScrollExample(),
        ),
        GoRoute(
          path: "example-icon-button",
          builder: (context, state) => const IconButtonExample(),
        ),
        GoRoute(
          path: "internal-color-test",
          builder: (context, state) => const InternalColorTestScreen(),
        ),
        GoRoute(
          path: "example-accordion",
          builder: (context, state) => const AccordionExample(),
        ),
        GoRoute(
          path: "example-tabs",
          builder: (context, state) => const TabExample(),
        ),
        GoRoute(
          path: "accordion-with-rounded-corners",
          builder: (context, state) =>
              const AccordionWithRoundedCornersPreview(),
        ),
        GoRoute(
          path: "accordion-disabled-preview",
          builder: (context, state) => const AccordionDisabledPreview(),
        ),
        GoRoute(
          path: "accordion-default-preview",
          builder: (context, state) => const AccordionDefaultValuePreview(),
        ),
        GoRoute(
          path: "nested-accordion-preview",
          builder: (context, state) => const NestedAccordionPreview(),
        ),
        GoRoute(
          path: "example-header",
          builder: (context, state) => const HeaderExample(),
        ),
        GoRoute(
          path: "example-bottom-sheet",
          builder: (context, state) => const BottomModalSheetExample(),
        ),
        GoRoute(
          path: "stepper-example",
          builder: (context, state) => const StepperExample(),
        ),
        GoRoute(
          path: "navigation-rail-preview",
          builder: (context, state) => const NavigationRailExample(),
        ),

        // Generate individual Storybook screens for every widget. This is referenced in docs website iframe.
        ...kStories.map(
          (item) => GoRoute(
            path: item.routePath,
            builder: (context, state) => StorybookWrapper(
              story: item.story,
              storyName: item.storyName,
            ),
          ),
        ),
      ],
    ),
  ],
);
