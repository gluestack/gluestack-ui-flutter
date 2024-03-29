import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_a_item_internal.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_accordian_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_group_value.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/style_accordion_header.dart';

final AccordionExpansionValue accGroupValue = AccordionExpansionValue();

enum GSAccordionSizes { $sm, $md, $lg }

enum GSAccordionVariants { filled, unfilled }

enum GSAccordionTypes { single, multiple }

class GSAccordion extends StatefulWidget {
  final GSStyle? style;

  final List<GSAccordionItem> children;

  final GSAccordionSizes? size;
  final GSAccordionTypes? type;
  final GSAccordionVariants? variant;

  final bool? isDisabled;
  final bool? isCollapsible;

  final Duration? animationDuration;
  final GSAccordionIcon? iconWhenTileExpanded;
  final GSAccordionIcon? iconWhenTileCollapsed;

  const GSAccordion({
    super.key,
    required this.children,
    this.size = GSAccordionSizes.$md,
    this.type = GSAccordionTypes.multiple,
    this.variant = GSAccordionVariants.unfilled,
    this.isDisabled = false,
    this.isCollapsible = false,
    this.animationDuration = const Duration(milliseconds: 200),
    this.style,
    this.iconWhenTileExpanded,
    this.iconWhenTileCollapsed,
  });

  @override
  State<GSAccordion> createState() => _GSAccordionState();
}

class _GSAccordionState extends State<GSAccordion> {
  @override
  initState() {
    accGroupValue.init(widget.children.length);
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
      //TODO: utilise elevation (styler.elevation)
      child: Container(
        decoration: BoxDecoration(
          color: styler.bg,
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
                    iconWhenTileCollapsed: widget.iconWhenTileCollapsed,
                    iconWhenTileExpanded: widget.iconWhenTileExpanded,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
