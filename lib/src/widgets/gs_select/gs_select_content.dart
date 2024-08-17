import 'package:flutter/cupertino.dart';
import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_content_style.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_item_style.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_selected_input_style.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_style.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_text_style.dart';
import 'package:gluestack_ui/src/widgets/gs_text/gs_text_style.dart';

class GSSelectContent extends StatefulWidget {
  final GSStyle? style;
  final List<String> options;
  final List<String>? disabledOptions;
  final String? initialLabel;

  const GSSelectContent({
    super.key,
    this.style,
    required this.options,
    this.disabledOptions,
    this.initialLabel,
  });

  @override
  State<GSSelectContent> createState() => _GSSelectContentState();
}

class _GSSelectContentState extends State<GSSelectContent> {
  @override
  Widget build(BuildContext context) {
    final provider = GSSelectProvider.of(context);
    final contentStyler = resolveStyles(
      context: context,
      styles: [selectContentStyle],
      inlineStyle: widget.style,
    );

    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [selectStyle],
      inlineStyle: widget.style,
    );

    GSConfigStyle textStyler = resolveStyles(
      context: context,
      styles: [
        gstextStyle,
        selectTextStyle,
        selectTextStyle.variantMap(provider?.selectVariant),
        selectTextStyle.sizeMap(GSSizes.$md),
      ],
      inlineStyle: provider?.style,
    );

    final itemStyler = resolveStyles(
      context: context,
      styles: [
        selectItemStyle,
      ],
      inlineStyle: provider?.style,
    );

    final selectedInputStyler = resolveStyles(
      context: context,
      styles: [
        selectSelectedInputStyle,
      ],
      inlineStyle: provider?.style,
    );

    final inputTextStyle = textStyler.textStyle?.copyWith(
        decoration: textStyler.textStyle?.decoration ?? TextDecoration.none,
        fontFamily: widget.style?.textStyle?.fontFamily ??
            textStyler.textStyle?.fontFamily,
        fontWeight: widget.style?.textStyle?.fontWeight ??
            textStyler.textStyle?.fontWeight,
        fontStyle: widget.style?.textStyle?.fontStyle ??
            textStyler.textStyle?.fontStyle,
        backgroundColor: widget.style?.textStyle?.backgroundColor ??
            textStyler.textStyle?.backgroundColor,
        overflow:
            widget.style?.textStyle?.overflow ?? textStyler.textStyle?.overflow,
        color: widget.style?.textStyle?.color ??
            textStyler.color?.getColor(context) ??
            gstextStyle.color?.getColor(context),
        fontSize: widget.style?.textStyle?.fontSize ??
            textStyler.textStyle?.fontSize);

    return Container(
      height: widget.style?.height ?? styler.height ?? 200,
      width: widget.style?.width ?? styler.width ?? 200,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(widget.style?.borderRadius ?? 6)),
        color: widget.style?.color ?? contentStyler.bg?.getColor(context),
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          controller: provider?.scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: provider?.removeOverlay,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(0, 178, 20, 20),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widget.style?.borderRadius ?? 6),
                      topRight:
                          Radius.circular(widget.style?.borderRadius ?? 6),
                    ),
                  ),
                  child: Row(
                    children: [
                      if (provider?.selectedOption == null)
                        Icon(
                          CupertinoIcons.check_mark,
                          size: inputTextStyle?.fontSize ?? 16,
                          color: widget.style?.iconColor ??
                              inputTextStyle?.color ??
                              textStyler.color?.getColor(context),
                        ),
                      if (provider?.selectedOption != null)
                        Icon(
                          CupertinoIcons.check_mark,
                          size: inputTextStyle?.fontSize ?? 16,
                          color: const Color.fromARGB(0, 0, 0, 0),
                        ),
                      const SizedBox(width: 6.0),
                      Text(
                        provider?.label ?? "Select Option",
                        style: inputTextStyle?.copyWith(
                          color: inputTextStyle.color?.withOpacity(
                                selectedInputStyler.onDisabled?.opacity ?? 0.4,
                              ) ??
                              textStyler.color?.getColor(context).withOpacity(
                                    selectedInputStyler.onDisabled?.opacity ??
                                        0.4,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ...widget.options.asMap().entries.map((entry) {
                int index = entry.key;
                String option = entry.value;
                final isDisabled =
                    widget.disabledOptions?.contains(option) ?? false;
                provider?.itemKeys[option] = GlobalKey();

                return StatefulBuilder(
                  key: provider?.itemKeys[option],
                  builder: (context, setState) {
                    return FocusableActionDetector(
                      onShowHoverHighlight: (value) {
                        if (!isDisabled) {
                          setState(() {
                            provider?.hoveredIndex = value ? index : null;
                          });
                        }
                      },
                      child: GsGestureDetector(
                        onPressed: () {
                          if (!isDisabled) {
                            provider?.selectOption(option);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: provider?.selectedOption == option
                                  ? itemStyler.onActive?.bg?.getColor(context)
                                  : (provider?.hoveredIndex == index
                                      ? itemStyler.onHover?.bg
                                          ?.getColor(context)
                                      : const Color.fromARGB(0, 0, 0, 0)),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  widget.style?.borderRadius ?? 5)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Row(
                              children: [
                                if (provider?.selectedOption == option)
                                  Icon(
                                    CupertinoIcons.check_mark,
                                    size: inputTextStyle?.fontSize ?? 16,
                                    color: widget.style?.iconColor ??
                                        inputTextStyle?.color ??
                                        textStyler.color?.getColor(context),
                                  ),
                                if (provider?.selectedOption != option)
                                  Icon(
                                    CupertinoIcons.check_mark,
                                    size: inputTextStyle?.fontSize ?? 16,
                                    color: const Color.fromARGB(0, 0, 0, 0),
                                  ),
                                const SizedBox(width: 6.0),
                                Expanded(
                                  child: Text(
                                    option,
                                    overflow: TextOverflow.ellipsis,
                                    style: inputTextStyle?.copyWith(
                                      color: isDisabled
                                          ? inputTextStyle.color?.withOpacity(
                                                selectedInputStyler
                                                        .onDisabled?.opacity ??
                                                    0.4,
                                              ) ??
                                              textStyler.color
                                                  ?.getColor(context)
                                                  .withOpacity(
                                                    selectedInputStyler
                                                            .onDisabled
                                                            ?.opacity ??
                                                        0.4,
                                                  )
                                          : inputTextStyle.color ??
                                              textStyler.color
                                                  ?.getColor(context) ??
                                              gstextStyle.color
                                                  ?.getColor(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
