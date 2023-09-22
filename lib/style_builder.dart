import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style_provider.dart';

enum WidgetType { button, text, container }

enum ButtonAction { primary, secondary }

final Map<WidgetType, Map<ButtonAction, StyleAttributes>> styles = {
  WidgetType.button: {
    ButtonAction.primary: StyleAttributes({
      'backgroundColor': Colors.red,
      'borderColor': Colors.transparent,
    }),
    ButtonAction.secondary: StyleAttributes({'textColor': Colors.black}),
  },
  // Add styles for other widget types as needed
};

class StyledWidget extends StatelessWidget {
  final WidgetType widgetType;

  final Widget child;

  final ButtonAction action;

  StyledWidget({
    required this.widgetType,
    required this.action,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final style = styles[widgetType]?[action];
    return StyleProvider(
      style: style!,
      child: child,
    );
  }
}
