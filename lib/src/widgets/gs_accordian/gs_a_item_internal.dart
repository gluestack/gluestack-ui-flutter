import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_accordian_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/style_accordion_content.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/style_accordion_icon.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/style_accordion_trigger.dart';
import 'package:gluestack_ui/src/widgets/gs_icon/gs_icon_style.dart';

class GSAccordionItemInternal extends StatelessWidget {
  final int id;
  final bool isExpanded;
  final GSAccordionTitle title;
  final GSAccordionContent? content;
  final Duration? animationDuration;
  final GSStyle? contentStyle;
  final GSStyle? headerStyle;

  final GSAccordionIcon? iconWhenTileExpanded;
  final GSAccordionIcon? iconWhenTileCollapsed;

  const GSAccordionItemInternal({
    super.key,
    required this.id,
    required this.isExpanded,
    required this.title,
    this.content,
    this.animationDuration = const Duration(milliseconds: 300),
    this.contentStyle,
    this.headerStyle,
    this.iconWhenTileExpanded,
    this.iconWhenTileCollapsed,
  });

  @override
  Widget build(BuildContext context) {
    final baseAccordionStyle =
        GSAccordionProvider.of(context)?.baseAccordionStyle;

    final isDisabled = GSAccordionProvider.of(context)?.isDisabled ?? false;
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
      child: AnimatedContainer(
        duration: animationDuration!,
        decoration: BoxDecoration(
          color: headerStyle?.bg,
        ),
        child: Column(
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
                      Expanded(child: title),
                      isExpanded && !isDisabled
                          ? iconWhenTileExpanded ??
                              RotatedBox(
                                quarterTurns: 1,
                                child: Icon(
                                  size: defIconSize,
                                  const IconData(0xf571,
                                      fontFamily: 'MaterialIcons',
                                      matchTextDirection: true),
                                ),
                              )
                          : iconWhenTileCollapsed ??
                              RotatedBox(
                                quarterTurns: 3,
                                child: Icon(
                                  size: defIconSize,
                                  const IconData(0xf571,
                                      fontFamily: 'MaterialIcons',
                                      matchTextDirection: true),
                                ),
                              ),
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
    );
  }
}
