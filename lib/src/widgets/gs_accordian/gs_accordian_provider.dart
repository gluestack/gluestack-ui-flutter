import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_accordian.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_group_value.dart';

class GSAccordionProvider extends InheritedWidget {
  final bool isDisabled;
  final bool isCollapsible;
  final GSAccordionTypes type;
  final GSAccordionSizes size;
  final GSStyle baseAccordionStyle;
  final AccordionExpansionValue accGrpValue;

  const GSAccordionProvider({
    super.key,
    required this.isDisabled,
    required this.isCollapsible,
    required this.type,
    required this.size,
    required this.baseAccordionStyle,
    required super.child,
    required this.accGrpValue,
  });

  @override
  bool updateShouldNotify(GSAccordionProvider oldWidget) {
    return isDisabled != oldWidget.isDisabled ||
        isCollapsible != oldWidget.isCollapsible ||
        type != oldWidget.type || accGrpValue != oldWidget.accGrpValue ||
        baseAccordionStyle != oldWidget.baseAccordionStyle;
  }

  static GSAccordionProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSAccordionProvider>();
  }
}
