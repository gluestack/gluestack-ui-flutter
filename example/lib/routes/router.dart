import 'package:flutter/material.dart';
import 'package:gluestack_ui_example/home.dart';
import 'package:gluestack_ui_example/main.dart';
import 'package:gluestack_ui_example/preview_widgets/alert_dialog_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/avatar_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/badge_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/badge_with_avatar_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/box_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/button_group_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/button_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/button_with_full_width_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/button_with_icon_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/center_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/checkbox_group_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/checkbox_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/controlled_checkbox_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/divider_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/divider_variants_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/formcontrol_checkbox_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/hstack_reversed_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/icon_button_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/input_with_formcontrol_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/input_with_icon_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/link_button_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/link_with_icon_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/link_with_text_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/loading_button_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/fab_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/heading_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/hstack_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/icon_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/image_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/input_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/link_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/multiple_checkbox_horizontal_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/multiple_checkbox_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/multiple_radio_button_horizontal_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/multiple_radio_button_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/pressable_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/pressable_with_states_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/progress_colors_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/progress_custom_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/progress_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/progress_value_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/radio_button_controlled_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/radio_button_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/radio_button_with_formcontrol_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/radio_button_with_help_text_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/spinner_colors_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/spinner_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/spinner_with_label_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/switch_checked_state_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/switch_color_scheme_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/switch_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/switch_with_label_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/text_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/textarea_formcontrol_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/textarea_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/toast_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/uncontrolled_checkbox_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/vstack_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/vstack_reversed_preview.dart';
import 'package:go_router/go_router.dart';

import '../preview_widgets/checkbox_with_help_text_preview.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: "buttonPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonPreview();
          },
        ),
        GoRoute(
          path: "loadingButtonPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const LoadingButtonPreview();
          },
        ),
        GoRoute(
          path: "iconButtonPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const IconButtonPreview();
          },
        ),
        GoRoute(
          path: "buttonGroupPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonGroupPreview();
          },
        ),
        GoRoute(
          path: "buttonWithIconsPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonWithIconsPreview();
          },
        ),
        GoRoute(
          path: "buttonWithLinkPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const LinkButtonPreview();
          },
        ),
        GoRoute(
          path: "buttonWithFullWidthPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonWithFullWidthPreview();
          },
        ),
        GoRoute(
          path: "inputPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const InputPreview();
          },
        ),
        GoRoute(
          path: "inputWithFormcontrolPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const InputWithFormcontrolPreview();
          },
        ),
        GoRoute(
          path: "inputWithIconPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const InputWithIconPreview();
          },
        ),
        GoRoute(
          path: "badgePreview",
          builder: (BuildContext context, GoRouterState state) {
            return const BadgePreview();
          },
        ),
        GoRoute(
          path: "badgeWithAvatarPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const BadgeWithAvatarPreview();
          },
        ),
        GoRoute(
          path: "switchPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const SwitchPreview();
          },
        ),
        GoRoute(
          path: "switchWithLabelPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const SwitchWithLabelPreview();
          },
        ),
        GoRoute(
          path: "switchCheckedStatePreview",
          builder: (BuildContext context, GoRouterState state) {
            return const SwitchCheckedStatePreview();
          },
        ),
        GoRoute(
          path: "switchWithColorSchemePreview",
          builder: (BuildContext context, GoRouterState state) {
            return const SwitchWithColorSchemePreview();
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
          path: "multipleCheckboxPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const MultipleCheckboxPreview();
          },
        ),
        GoRoute(
          path: "multipleCheckboxHorizontalPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const MultipleCheckboxHorizontalPreview();
          },
        ),
        GoRoute(
          path: "checkboxWithHelpTextPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const CheckboxWithHelpTextPreview();
          },
        ),
        GoRoute(
          path: "formControlCheckboxPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const FormControlCheckboxPreview();
          },
        ),
        GoRoute(
          path: "controlledCheckboxPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ControlledCheckboxPreview();
          },
        ),
        GoRoute(
          path: "uncontrolledCheckboxPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const UncontrolledCheckboxPreview();
          },
        ),
        GoRoute(
          path: "checkboxGroupPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const CheckboxGroupPreview();
          },
        ),
        GoRoute(
          path: "hstackPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const HStackPreview();
          },
        ),
        GoRoute(
          path: "hstackReversedPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const HStackReversedPreview();
          },
        ),
        GoRoute(
          path: "vstackPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const VStackPreview();
          },
        ),
        GoRoute(
          path: "vstackReversedPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const VStackReversedPreview();
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
          path: "multipleRadioButtonPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const MultipleRadioButtonPreview();
          },
        ),
        GoRoute(
          path: "multipleRadioButtonHorizontalPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const MultipleRadioButtonHorizontalPreview();
          },
        ),
        GoRoute(
          path: "radioButtonWithHelpTextPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const RadioButtonWithHelpTextPreview();
          },
        ),
        GoRoute(
          path: "radioButtonWithFormControlPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const RadioButtonWithFormControlPreview();
          },
        ),
        GoRoute(
          path: "radioButtonControlledPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const RadioButtonControlledPreview();
          },
        ),
        GoRoute(
          path: "progressPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ProgressPreview();
          },
        ),
        GoRoute(
          path: "progressValuePreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ProgressValuePreview();
          },
        ),
        GoRoute(
          path: "progressColorsPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ProgressColorsPreview();
          },
        ),
        GoRoute(
          path: "progressCustomPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const ProgressCustomPreview();
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
          path: "dividerVariantsPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const DividerVariantsPreview();
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
          path: "spinnerWithLabelPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const SpinnerWithLabelPreview();
          },
        ),
        GoRoute(
          path: "spinnerWithColorsPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const SpinnerWithColorsPreview();
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
          path: "linkWithTextPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const LinkWithTextPreview();
          },
        ),
        GoRoute(
          path: "linkWithIconPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const LinkWithIconPreview();
          },
        ),
        GoRoute(
          path: "pressablePreview",
          builder: (BuildContext context, GoRouterState state) {
            return const PressablePreview();
          },
        ),
        GoRoute(
          path: "pressableWithStatesPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const PressableWithStatesPreview();
          },
        ),
        GoRoute(
          path: "textareaPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const TextareaPreview();
          },
        ),
        GoRoute(
          path: "textareaFormControlPreview",
          builder: (BuildContext context, GoRouterState state) {
            return const TextareaFormControlPreview();
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
      ],
    ),
  ],
);
