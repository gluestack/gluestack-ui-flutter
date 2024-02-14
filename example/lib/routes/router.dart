import 'package:flutter/material.dart';
import 'package:gluestack_ui_example/example/icon_button_example.dart';
import 'package:gluestack_ui_example/example/internal_colors_example.dart';
import 'package:gluestack_ui_example/example/public.dart';
import 'package:gluestack_ui_example/example/scroll_example.dart';
import 'package:gluestack_ui_example/home.dart';
import 'package:gluestack_ui_example/widgets/storybook.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/public.dart';
import 'package:gluestack_ui_example/widgets/storybook_wrapper.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
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
