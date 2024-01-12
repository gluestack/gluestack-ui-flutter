import 'package:flutter/material.dart';
import 'package:gluestack_ui_example/example/public.dart';
import 'package:gluestack_ui_example/home.dart';
import 'package:gluestack_ui_example/widgets/storybook.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/avatar_with_label_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/badge_with_avatar_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/button_group_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/button_with_full_width_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/button_with_icon_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/checkbox_group_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/checkbox_with_help_text_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/controlled_checkbox_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/divider_variants_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/hstack_reversed_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/icon_button_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/input_with_formcontrol_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/input_with_icon_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/link_button_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/link_with_icon_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/link_with_text_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/loading_button_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/multiple_checkbox_horizontal_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/multiple_checkbox_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/multiple_radio_button_horizontal_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/multiple_radio_button_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/pressable_with_states_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/progress_colors_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/progress_custom_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/progress_value_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/public.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/radio_button_controlled_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/radio_button_with_formcontrol_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/radio_button_with_help_text_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/spinner_colors_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/spinner_with_label_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/switch_checked_state_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/switch_color_scheme_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/switch_with_label_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/textarea_formcontrol_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/uncontrolled_checkbox_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/vstack_reversed_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook_wrapper.dart';
import 'package:go_router/go_router.dart';

import '../widgets/storybook_widgets/formcontrol_checkbox_preview.dart';

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
          path: "avatar-with-label-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const AvatarWithLabelPreview();
          },
        ),
        GoRoute(
          path: "example-badge",
          builder: (context, state) => const BadgeExample(),
        ),
        GoRoute(
          path: "badge-with-avatar-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const BadgeWithAvatarPreview();
          },
        ),
        GoRoute(
          path: "example-button",
          builder: (context, state) => const ButtonExample(),
        ),
        GoRoute(
          path: "loading-button-preview",
          builder: (context, state) => const LoadingButtonPreview(),
        ),
        GoRoute(
          path: "icon-button-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const IconButtonPreview();
          },
        ),
        GoRoute(
          path: "button-group-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonGroupPreview();
          },
        ),
        GoRoute(
          path: "button-with-icons-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonWithIconsPreview();
          },
        ),
        GoRoute(
          path: "button-with-link-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const LinkButtonPreview();
          },
        ),
        GoRoute(
          path: "button-with-fullwidth-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonWithFullWidthPreview();
          },
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
          path: "multiple-checkbox-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const MultipleCheckboxPreview();
          },
        ),
        GoRoute(
          path: "multiple-checkbox-horizontal-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const MultipleCheckboxHorizontalPreview();
          },
        ),
        GoRoute(
          path: "checkbox-with-help-text-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const CheckboxWithHelpTextPreview();
          },
        ),
        GoRoute(
          path: "form-control-checkbox-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const FormControlCheckboxPreview();
          },
        ),
        GoRoute(
          path: "controlled-checkbox-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const ControlledCheckboxPreview();
          },
        ),
        GoRoute(
          path: "uncontrolled-checkbox-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const UncontrolledCheckboxPreview();
          },
        ),
        GoRoute(
          path: "checkbox-group-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const CheckboxGroupPreview();
          },
        ),
        GoRoute(
          path: "example-divider",
          builder: (context, state) => const DividerExample(),
        ),

        GoRoute(
          path: "divider-variants-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const DividerVariantsPreview();
          },
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
          path: "hstack-reversed-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const HStackReversedPreview();
          },
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
          path: "input-with-formcontrol-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const InputWithFormcontrolPreview();
          },
        ),
        GoRoute(
          path: "input-with-icon-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const InputWithIconPreview();
          },
        ),
        GoRoute(
          path: "example-link",
          builder: (context, state) => const LinkExample(),
        ),
        GoRoute(
          path: "link-with-text-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const LinkWithTextPreview();
          },
        ),
        GoRoute(
          path: "link-with-icon-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const LinkWithIconPreview();
          },
        ),
        GoRoute(
          path: "example-pressable",
          builder: (context, state) => const PressableExample(),
        ),
        GoRoute(
          path: "pressable-with-states-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const PressableWithStatesPreview();
          },
        ),
        GoRoute(
          path: "example-progress",
          builder: (context, state) => const ProgressExample(),
        ),

        GoRoute(
          path: "progress-value-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const ProgressValuePreview();
          },
        ),
        GoRoute(
          path: "progress-colors-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const ProgressColorsPreview();
          },
        ),
        GoRoute(
          path: "progress-custom-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const ProgressCustomPreview();
          },
        ),
        GoRoute(
          path: "example-radio-button",
          builder: (context, state) => const RadioButtonExample(),
        ),

        GoRoute(
          path: "multiple-radio-button-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const MultipleRadioButtonPreview();
          },
        ),
        GoRoute(
          path: "multiple-radio-button-horizontal-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const MultipleRadioButtonHorizontalPreview();
          },
        ),
        GoRoute(
          path: "radio-button-with-help-text-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const RadioButtonWithHelpTextPreview();
          },
        ),
        GoRoute(
          path: "radio-button-with-formcontrol-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const RadioButtonWithFormControlPreview();
          },
        ),
        GoRoute(
          path: "radio-button-controlled-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const RadioButtonControlledPreview();
          },
        ),
        GoRoute(
          path: "example-spinner",
          builder: (context, state) => const SpinnerExample(),
        ),

        GoRoute(
          path: "spinner-with-label-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const SpinnerWithLabelPreview();
          },
        ),
        GoRoute(
          path: "spinner-with-colors-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const SpinnerWithColorsPreview();
          },
        ),
        GoRoute(
          path: "example-switch",
          builder: (context, state) => const SwitchExample(),
        ),
        GoRoute(
          path: "switch-with-label-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const SwitchWithLabelPreview();
          },
        ),
        GoRoute(
          path: "switch-checked-state-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const SwitchCheckedStatePreview();
          },
        ),
        GoRoute(
          path: "switch-with-color-scheme-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const SwitchWithColorSchemePreview();
          },
        ),
        GoRoute(
          path: "example-text_area",
          builder: (context, state) => const TextAreaExample(),
        ),
        GoRoute(
          path: "textarea-formcontrol-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const TextareaFormControlPreview();
          },
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
          path: "vstack-reversed-preview",
          builder: (BuildContext context, GoRouterState state) {
            return const VStackReversedPreview();
          },
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
