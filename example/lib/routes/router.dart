import 'package:flutter/material.dart';
import 'package:gluestack_ui_example/home.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/avatar_group_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/avatar_with_image_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/badge_with_avatar_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/button_group_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/button_with_full_width_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/button_with_icon_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/checkbox_group_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/checkbox_with_help_text_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/controlled_checkbox_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/divider_variants_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/fab_placement_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/fab_with_icon_and_text_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/fab_with_icon_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/formcontrol_checkbox_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/hstack_reversed_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/icon_button_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/input_with_formcontrol_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/input_with_icon_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/link_button_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/link_with_icon_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/link_with_text_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/loading_button_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/multiple_checkbox_horizontal_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/multiple_checkbox_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/multiple_radio_button_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/pressable_with_states_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/progress_colors_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/progress_custom_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/progress_value_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/radio_button_controlled_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/radio_button_with_formcontrol_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/radio_button_with_help_text_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/spinner_colors_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/spinner_with_label_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/switch_checked_state_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/switch_color_scheme_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/textarea_formcontrol_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/uncontrolled_checkbox_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/vstack_reversed_preview.dart';
import 'package:go_router/go_router.dart';

import 'package:gluestack_ui_example/widgets/components/widgets/accordian_example.dart';
import 'package:gluestack_ui_example/widgets/storybook/storybook.dart';
import 'package:gluestack_ui_example/widgets/storybook/storybook_wrapper.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/accordion_default_value_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/accordion_disabled_preview.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/accordion_with_rounded_corners.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/nested_accordion_preview.dart';
import 'package:go_router/go_router.dart';

import '../widgets/components/widgets/public.dart';
import '../widgets/storybook/widgets/avatar_with_label_preview.dart';
import '../widgets/storybook/widgets/multiple_radio_button_horizontal_preview.dart';
import '../widgets/storybook/widgets/public.dart';
import '../widgets/storybook/widgets/switch_with_label_preview.dart';

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
          builder: (context, state) => const AvatarWithLabelPreview(),
        ),
        GoRoute(
          path: "avatar-with-image-preview",
          builder: (context, state) => const AvatarWithImagePreview(),
        ),
        GoRoute(
          path: "avatar-group-preview",
          builder: (context, state) => const AvatarGroupPreview(),
        ),

        GoRoute(
          path: "example-badge",
          builder: (context, state) => const BadgeExample(),
        ),
        GoRoute(
          path: "badge-with-avatar-preview",
          builder: (context, state) => const BadgeWithAvatarPreview(),
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
          builder: (context, state) => const IconButtonPreview(),
        ),
        GoRoute(
          path: "button-group-preview",
          builder: (context, state) => const ButtonGroupPreview(),
        ),
        GoRoute(
          path: "button-with-icons-preview",
          builder: (context, state) => const ButtonWithIconsPreview(),
        ),
        GoRoute(
          path: "button-with-link-preview",
          builder: (context, state) => const LinkButtonPreview(),
        ),
        GoRoute(
          path: "button-with-fullwidth-preview",
          builder: (context, state) => const ButtonWithFullWidthPreview(),
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
          builder: (context, state) => const MultipleCheckboxPreview(),
        ),
        GoRoute(
          path: "multiple-checkbox-horizontal-preview",
          builder: (context, state) =>
              const MultipleCheckboxHorizontalPreview(),
        ),
        GoRoute(
          path: "checkbox-with-helptext-preview",
          builder: (context, state) => const CheckboxWithHelpTextPreview(),
        ),
        GoRoute(
          path: "form-control-checkbox-preview",
          builder: (context, state) => const FormControlCheckboxPreview(),
        ),
        GoRoute(
          path: "controlled-checkbox-preview",
          builder: (context, state) => const ControlledCheckboxPreview(),
        ),
        GoRoute(
          path: "uncontrolled-checkbox-preview",
          builder: (context, state) => const UncontrolledCheckboxPreview(),
        ),
        GoRoute(
          path: "checkbox-group-preview",
          builder: (context, state) => const CheckboxGroupPreview(),
        ),
        GoRoute(
          path: "example-divider",
          builder: (context, state) => const DividerExample(),
        ),

        GoRoute(
          path: "divider-variants-preview",
          builder: (context, state) => const DividerVariantsPreview(),
        ),
        GoRoute(
          path: "example-fab",
          builder: (context, state) => const FabExample(),
        ),
        GoRoute(
          path: "fab-with-icon-preview",
          builder: (context, state) => const FabWithIconPreview(),
        ),
        GoRoute(
          path: "fab-with-icon-and-text-preview",
          builder: (context, state) => const FabWithIconAndTextPreview(),
        ),
        GoRoute(
          path: "fab-placement-preview",
          builder: (context, state) => const FabPlacementPreview(),
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
          builder: (context, state) => const HStackReversedPreview(),
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
          path: "input-with-form-control-preview",
          builder: (context, state) => const InputWithFormcontrolPreview(),
        ),
        GoRoute(
          path: "input-with-icon-preview",
          builder: (context, state) => const InputWithIconPreview(),
        ),
        GoRoute(
          path: "example-link",
          builder: (context, state) => const LinkExample(),
        ),
        GoRoute(
          path: "link-with-text-preview",
          builder: (context, state) => const LinkWithTextPreview(),
        ),
        GoRoute(
          path: "link-with-icon-preview",
          builder: (context, state) => const LinkWithIconPreview(),
        ),
        GoRoute(
          path: "example-pressable",
          builder: (context, state) => const PressableExample(),
        ),
        GoRoute(
          path: "pressable-with-states-preview",
          builder: (context, state) => const PressableWithStatesPreview(),
        ),
        GoRoute(
          path: "example-progress",
          builder: (context, state) => const ProgressExample(),
        ),

        GoRoute(
          path: "progress-value-preview",
          builder: (context, state) => const ProgressValuePreview(),
        ),
        GoRoute(
          path: "progress-colors-preview",
          builder: (context, state) => const ProgressColorsPreview(),
        ),
        GoRoute(
          path: "progress-custom-preview",
          builder: (context, state) => const ProgressCustomPreview(),
        ),
        GoRoute(
          path: "example-radio-button",
          builder: (context, state) => const RadioButtonExample(),
        ),

        GoRoute(
          path: "multiple-radio-button-preview",
          builder: (context, state) => const MultipleRadioButtonPreview(),
        ),
        GoRoute(
          path: "multiple-radio-button-horizontal-preview",
          builder: (context, state) =>
              const MultipleRadioButtonHorizontalPreview(),
        ),
        GoRoute(
          path: "radio-button-with-help-text-preview",
          builder: (context, state) => const RadioButtonWithHelpTextPreview(),
        ),
        GoRoute(
          path: "radio-button-with-form-control-preview",
          builder: (context, state) =>
              const RadioButtonWithFormControlPreview(),
        ),
        GoRoute(
          path: "radio-button-controlled-preview",
          builder: (context, state) => const RadioButtonControlledPreview(),
        ),
        GoRoute(
          path: "example-spinner",
          builder: (context, state) => const SpinnerExample(),
        ),

        GoRoute(
          path: "spinner-with-label-preview",
          builder: (context, state) => const SpinnerWithLabelPreview(),
        ),
        GoRoute(
          path: "spinner-with-colors-preview",
          builder: (context, state) => const SpinnerWithColorsPreview(),
        ),
        GoRoute(
          path: "example-switch",
          builder: (context, state) => const SwitchExample(),
        ),
        GoRoute(
          path: "switch-with-label-preview",
          builder: (context, state) => const SwitchWithLabelPreview(),
        ),
        GoRoute(
          path: "switch-checked-state-preview",
          builder: (context, state) => const SwitchCheckedStatePreview(),
        ),
        GoRoute(
          path: "switch-with-color-scheme-preview",
          builder: (context, state) => const SwitchWithColorSchemePreview(),
        ),
        GoRoute(
          path: "example-text_area",
          builder: (context, state) => const TextAreaExample(),
        ),
        GoRoute(
          path: "textarea-form-control-preview",
          builder: (context, state) => const TextareaFormControlPreview(),
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
          builder: (context, state) => const VStackReversedPreview(),
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
