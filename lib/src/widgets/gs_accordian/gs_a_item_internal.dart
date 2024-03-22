import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_accordian_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_group_value.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/style_accordion_content.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/style_accordion_icon.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/style_accordion_trigger.dart';
import 'package:gluestack_ui/src/widgets/gs_icon/gs_icon_style.dart';

class GSAccordionItemInternal extends StatelessWidget {
  final int id;
  final bool isExpanded;
  final GSAccordionTitle title;
  final Widget? content;
  final Duration? animationDuration;
  final GSStyle? contentStyle;
  final GSStyle? headerStyle;

  final GSAccordionIcon? suffixIconWhenTileExpanded;
  final GSAccordionIcon? suffixIconWhenTileCollapsed;
  final bool? showSuffixIcon;

  final GSAccordionIcon? prefixIconWhenTileExpanded;
  final GSAccordionIcon? prefixIconWhenTileCollapsed;

  final EdgeInsets? prefixIconPadding;
  final EdgeInsets? itemPadding;

  final double? radius;
  final bool? isItemDisabled;

  const GSAccordionItemInternal({
    super.key,
    required this.id,
    required this.isExpanded,
    required this.title,
    this.content,
    this.animationDuration = const Duration(milliseconds: 300),
    this.contentStyle,
    this.headerStyle,
    this.suffixIconWhenTileExpanded,
    this.suffixIconWhenTileCollapsed,
    this.showSuffixIcon = true,
    this.prefixIconWhenTileCollapsed,
    this.prefixIconWhenTileExpanded,
    this.prefixIconPadding,
    this.radius = 0,
    this.itemPadding,
    this.isItemDisabled,
  });

  @override
  Widget build(BuildContext context) {
    final accGroupValue = 
        GSAccordionProvider.of(context)?.accGrpValue ?? AccordionExpansionValue() ;

    final baseAccordionStyle =
        GSAccordionProvider.of(context)?.baseAccordionStyle;

    final isDisabled =  isItemDisabled ?? GSAccordionProvider.of(context)?.isDisabled ?? false;
    final isCollapsible =
        GSAccordionProvider.of(context)?.isCollapsible ?? false;

    final cursor =
        isDisabled ? SystemMouseCursors.forbidden : MouseCursor.defer;

    final type =
        GSAccordionProvider.of(context)?.type ?? GSAccordionTypes.multiple;

    final headerStylef = headerStyle?.merge(
            baseAccordionStyle?.merge(accordionTriggerStyle) ??
                accordionTriggerStyle) ??
        baseAccordionStyle?.merge(accordionTriggerStyle) ??
        accordionTriggerStyle;

    final contentStylef = contentStyle?.merge(
            baseAccordionStyle?.merge(accordionContentStyle) ??
                accordionContentStyle) ??
        baseAccordionStyle?.merge(accordionContentStyle) ??
        accordionContentStyle;

    final defIconSize = iconStyle
        .sizeMap(accordionIconStyle.props?.size ?? baseAccordionStyle?.iconSize)
        ?.width;

    return Opacity(
      opacity: isDisabled ? headerStylef.opacity ?? 0.5 : 1,
      child: Padding(
        padding: itemPadding ?? EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius ?? 0),
          child: AnimatedContainer(
            duration: animationDuration!,
            decoration: BoxDecoration(
              color: baseAccordionStyle?.bg ?? headerStyle?.bg,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Title ----------------------------------------------
                MouseRegion(
                  cursor: cursor,
                  child: GsGestureDetector(
                    onPressed: () {
                      //Fix
                      if (type == GSAccordionTypes.single &&
                          accGroupValue.getAccordionExpansionValue(id) &&
                          isCollapsible) {
                        // print('treue');
                        accGroupValue.toggleAccordionGroupValue(id);
                        return;
                      }

                      if (type == GSAccordionTypes.single) {
                        accGroupValue.resetAccordionGroupValue();
                      }
                      if (isCollapsible) {
                        accGroupValue.toggleAccordionGroupValue(id);
                      } else {
                        if (accGroupValue.getAccordionExpansionValue(id)) {
                          return;
                        } else {
                          accGroupValue.toggleAccordionGroupValue(id);
                        }
                      }
                    },
                    child: Padding(
                      padding: headerStylef.padding ?? EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isExpanded && !isDisabled
                              ? prefixIconWhenTileExpanded != null
                                  ? Padding(
                                      padding: prefixIconPadding ??
                                          const EdgeInsets.only(right: 4),
                                      child: prefixIconWhenTileExpanded)
                                  : const SizedBox.shrink()
                              : prefixIconWhenTileCollapsed != null
                                  ? Padding(
                                      padding: prefixIconPadding ??
                                          const EdgeInsets.only(right: 4),
                                      child: prefixIconWhenTileCollapsed)
                                  : const SizedBox.shrink(),
                          Expanded(child: title),
                          isExpanded && !isDisabled && showSuffixIcon!
                              ? suffixIconWhenTileExpanded ??
                                  RotatedBox(
                                    quarterTurns: 1,
                                    child: Icon(
                                      size: defIconSize,
                                      const IconData(0xf571,
                                          fontFamily: 'MaterialIcons',
                                          matchTextDirection: true),
                                    ),
                                  )
                              : showSuffixIcon!
                                  ? suffixIconWhenTileCollapsed ??
                                      RotatedBox(
                                        quarterTurns: 3,
                                        child: Icon(
                                          size: defIconSize,
                                          const IconData(0xf571,
                                              fontFamily: 'MaterialIcons',
                                              matchTextDirection: true),
                                        ),
                                      )
                                  : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ),

                //Content ---------------------------------------
                if (content != null)
                  AnimatedSize(
                    duration: animationDuration!,
                    child: Container(
                      margin: contentStylef.margin,
                      padding: contentStylef.padding,
                      width: double.maxFinite,
                      height: isExpanded && !isDisabled ? null : 0,
                      decoration: BoxDecoration(
                        color: contentStyle?.bg,
                      ),
                      child: content!,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
