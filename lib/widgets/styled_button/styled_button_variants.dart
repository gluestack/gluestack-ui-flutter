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
        },
        'link': {
          'backgroundColor': Colors.transparent,
          'borderColor': Colors.transparent,
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
        },
        'link': {
          'backgroundColor': Colors.transparent,
          'borderColor': Colors.transparent,
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
      },
      'sm': {
        'padding': StyledButtonTokens.buttonPadding['sm'],
        'borderRadius': StyledButtonTokens.buttonRadius['sm'],
      },
      'md': {
        'padding': StyledButtonTokens.buttonPadding['md'],
        'borderRadius': StyledButtonTokens.buttonRadius['md'],
      },
      'lg': {
        'padding': StyledButtonTokens.buttonPadding['lg'],
        'borderRadius': StyledButtonTokens.buttonRadius['lg'],
      },
    }
  },
);
