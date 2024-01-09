import 'package:flutter/material.dart';
import 'package:gluestack_ui_example/example/public.dart';
import 'package:gluestack_ui_example/home.dart';
import 'package:gluestack_ui_example/preview_widgets/alert_dialog_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/avatar_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/badge_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/box_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/button_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/center_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/checkbox_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/divider_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/fab_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/heading_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/hstack_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/icon_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/image_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/input_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/link_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/pressable_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/progress_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/radio_button_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/spinner_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/switch_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/text_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/textarea_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/toast_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/vstack_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook.dart';
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
          path: "buttonPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonPreview();
          },
        ),
        GoRoute(
          path: "inputPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const InputPreview();
          },
        ),
        GoRoute(
          path: "badgePreview",
          builder: (BuildContext context, GoRouterState state) {
            return const BadgePreview();
          },
        ),
        GoRoute(
          path: "switchPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const SwitchPreview();
          },
        ),
        GoRoute(
          path: "avatarPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const AvatarPreview();
          },
        ),
        GoRoute(
          path: "checkboxPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const CheckboxPreview();
          },
        ),
        GoRoute(
          path: "hstackPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const HStackPreview();
          },
        ),
        GoRoute(
          path: "vstackPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const VStackPreview();
          },
        ),
        GoRoute(
          path: "imagePreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ImagePreview();
          },
        ),
        GoRoute(
          path: "radioButtonPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const RadioButtonPreview();
          },
        ),
        GoRoute(
          path: "progressPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ProgressPreview();
          },
        ),
        GoRoute(
          path: "iconPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const IconPreview();
          },
        ),
        GoRoute(
          path: "textPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const TextPreview();
          },
        ),
        GoRoute(
          path: "headingPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const HeadingPreview();
          },
        ),
        GoRoute(
          path: "dividerPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const DividerPreview();
          },
        ),
        GoRoute(
          path: "centerPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const CenterPreview();
          },
        ),
        GoRoute(
          path: "boxPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const BoxPreview();
          },
        ),
        GoRoute(
          path: "spinnerPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const SpinnerPreview();
          },
        ),
        GoRoute(
          path: "toastPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ToastPreview();
          },
        ),
        GoRoute(
          path: "linkPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const LinkPreview();
          },
        ),
        GoRoute(
          path: "pressablePreview",
          builder: (BuildContext context, GoRouterState state) {
            return const PressablePreview();
          },
        ),
        GoRoute(
          path: "textareaPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const TextareaPreview();
          },
        ),
        GoRoute(
          path: "alertDialogPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const AlertDialogPreview();
          },
        ),
        GoRoute(
          path: "fabPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const FabPreview();
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
      ],
    ),
  ],
);
