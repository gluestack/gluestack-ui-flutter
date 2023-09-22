import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/styled_button/styled_button_token.dart';

class ButtonVariants {
  final Map<String, Map<String, dynamic>> variants;

  const ButtonVariants({required this.variants});
}

final buttonVariants = ButtonVariants(
  variants: {
    'action': {
      'primary': {
        'solid': {
          'backgroundColor': StyledButtonTokens.actionColors["primary"],
          'borderColor': Colors.transparent,
        },
        'outline': {
          'backgroundColor': Colors.transparent,
          'borderColor': StyledButtonTokens.actionColors["primary"],
          'textColor': StyledButtonTokens.actionColors["primary"],
        },
        'link': {
          'backgroundColor': Colors.transparent,
          'borderColor': Colors.transparent,
          'textColor': StyledButtonTokens.actionColors["primary"],
        },
      },
      'secondary': {
        'solid': {
          'backgroundColor': StyledButtonTokens.actionColors["secondary"],
          'borderColor': Colors.transparent,
        },
        'outline': {
          'backgroundColor': Colors.transparent,
          'borderColor': StyledButtonTokens.actionColors["secondary"],
          'textColor': StyledButtonTokens.actionColors["secondary"],
        },
        'link': {
          'backgroundColor': Colors.transparent,
          'borderColor': Colors.transparent,
          'textColor': StyledButtonTokens.actionColors["secondary"],
        },
      },
      'positive': {
        'solid': {
          'backgroundColor': StyledButtonTokens.actionColors["positive"],
          'borderColor': Colors.transparent,
        },
        'outline': {
          'backgroundColor': Colors.transparent,
          'borderColor': StyledButtonTokens.actionColors["positive"],
        },
        'link': {
          'backgroundColor': Colors.transparent,
          'borderColor': Colors.transparent,
        },
      },
      'negative': {
        'solid': {
          'backgroundColor': StyledButtonTokens.actionColors["negative"],
          'borderColor': Colors.transparent,
        },
        'outline': {
          'backgroundColor': Colors.transparent,
          'borderColor': StyledButtonTokens.actionColors["negative"],
        },
        'link': {
          'backgroundColor': Colors.transparent,
          'borderColor': Colors.transparent,
        },
      }
    },
    'size': {
      'xs': {
        'padding': StyledButtonTokens.buttonPadding['xs'],
        'borderRadius': StyledButtonTokens.buttonRadius['xs'],
        'fontSize': StyledButtonTokens.fontSize['xs']
      },
      'sm': {
        'padding': StyledButtonTokens.buttonPadding['sm'],
        'borderRadius': StyledButtonTokens.buttonRadius['sm'],
        'fontSize': StyledButtonTokens.fontSize['sm']
      },
      'md': {
        'padding': StyledButtonTokens.buttonPadding['md'],
        'borderRadius': StyledButtonTokens.buttonRadius['md'],
        'fontSize': StyledButtonTokens.fontSize['md']
      },
      'lg': {
        'padding': StyledButtonTokens.buttonPadding['lg'],
        'borderRadius': StyledButtonTokens.buttonRadius['lg'],
        'fontSize': StyledButtonTokens.fontSize['lg']
      },
    }
  },
);
