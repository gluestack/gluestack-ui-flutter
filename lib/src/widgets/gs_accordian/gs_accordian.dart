import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_a_item_internal.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_accordian_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_group_value.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/style_accordion_header.dart';


enum GSAccordionSizes { $sm, $md, $lg }

enum GSAccordionVariants { filled, unfilled }

enum GSAccordionTypes { single, multiple }

class GSAccordion extends StatefulWidget {
  final GSStyle? style;

  final List<GSAccordionItem> children;

  ///List of boolean values, true -> selected accordion item (expanded)
  final List<bool>? initialValues;

  final GSAccordionSizes? size;
  final GSAccordionTypes? type;
  final GSAccordionVariants? variant;

  final bool? isDisabled;
  final bool? isCollapsible;

  final Duration? animationDuration;
  final GSAccordionIcon? suffixIconWhenTileExpanded;
  final GSAccordionIcon? suffixIconWhenTileCollapsed;
  final bool? showSuffixIcon;

  final GSAccordionIcon? prefixIconWhenTileCollapsed;
  final GSAccordionIcon? prefixIconWhenTileExapanded;
  final EdgeInsets? prefixIconPadding;
  final EdgeInsets? itemPadding;

  const GSAccordion({
    super.key,
    required this.children,
    this.initialValues,
    this.size = GSAccordionSizes.$md,
    this.type = GSAccordionTypes.multiple,
    this.variant = GSAccordionVariants.unfilled,
    this.isDisabled = false,
    this.isCollapsible = false,
    this.animationDuration = const Duration(milliseconds: 200),
    this.style,
    this.suffixIconWhenTileExpanded,
    this.suffixIconWhenTileCollapsed,
    this.showSuffixIcon = true,
    this.prefixIconWhenTileCollapsed,
    this.prefixIconWhenTileExapanded,
    this.prefixIconPadding,
    this.itemPadding,
  }) : assert(initialValues == null || initialValues.length == children.length,
            'Length of initial array provided is not equal to number of accordion items present inside accordion widget!');

  @override
  State<GSAccordion> createState() => _GSAccordionState();
}

class _GSAccordionState extends State<GSAccordion> {
final AccordionExpansionValue accGroupValue = AccordionExpansionValue();

  @override
  initState() {
    accGroupValue.init(
        length: widget.children.length, initialValues: widget.initialValues);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(
        context: context,
        styles: [
          accordionStyle,
          accordionStyle.variantMap(widget.variant?.toGSVariant),
          accordionStyle.sizeMap(widget.size?.toGSSize),
        ],
        inlineStyle: widget.style,
        isFirst: true);
    // print("param: ${accordionHeaderStyle.margin}");
    // print("test: ${widget.gsAccordionVariant?.toGSVariant}");
    // print(accordionStyle.variants?.variant?.filled?.shadowColor);
    // print(
    //     "from json: ${getIt<GluestackCustomConfig>().accordion?['variants']?['variant']?['filled']?['backgroundColor']}");
    // print("---------END----------");
    return GSAccordionProvider(
      // refresh: true,
      isCollapsible: widget.isCollapsible!,
      isDisabled: widget.isDisabled!,
      type: widget.type!,
      size: widget.size!,
      baseAccordionStyle: styler,
      accGrpValue: accGroupValue,
      //TODO: utilise elevation (styler.elevation)
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: styler.shadowRadius ?? 0,
              color:
                  styler.shadowColor?.withOpacity(styler.shadowOpacity ?? 0) ??
                      $GSColors.backgroundDark100,
              offset: Offset(styler.shadowOffset?.width ?? 0,
                  styler.shadowOffset?.height ?? 0),
            ),
          ],
        ),
        child: ValueListenableBuilder<List<bool>>(
          valueListenable: accGroupValue.accGroupValues,
          builder: (context, value, child) {
            return Column(
              children: [
                for (int i = 0; i < widget.children.length; i++)
                  GSAccordionItemInternal(
                    id: i,
                    isExpanded: value[i],
                    title: widget.children[i].title,
                    content: widget.children[i].content,
                    animationDuration: widget.animationDuration,
                    contentStyle: styler.item,
                    headerStyle: accordionHeaderStyle,
                    suffixIconWhenTileCollapsed:
                        widget.suffixIconWhenTileCollapsed,
                    suffixIconWhenTileExpanded:
                        widget.suffixIconWhenTileExpanded,
                    showSuffixIcon: widget.showSuffixIcon,
                    prefixIconWhenTileCollapsed:
                        widget.prefixIconWhenTileCollapsed,
                    prefixIconWhenTileExpanded:
                        widget.prefixIconWhenTileExapanded,
                    prefixIconPadding: widget.prefixIconPadding,
                    radius: widget.children[i].radius,
                    itemPadding: widget.itemPadding,
                    isItemDisabled: widget.children[i].isDisabled,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
