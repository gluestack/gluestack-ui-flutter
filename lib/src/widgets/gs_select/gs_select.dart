import 'package:flutter/cupertino.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_content_style.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_icon_style.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_item_style.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_selected_input_style.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_selection_header_text.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_selection_header_text_style.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_text_style.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_trigger_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_text/gs_text_style.dart';

class GSSelect extends StatefulWidget {
  final List<String> options;
  final List<String>? disabledOptions;
  final GSSelectSizes? size;
  final GSSelectVariants? variant;
  final GSStyle? style;
  final GSSelectHeaderText hintText;
  final GSSelectIcon icon;

  const GSSelect({
    super.key,
    this.size,
    this.variant,
    required this.options,
    this.disabledOptions,
    required this.icon,
    required this.hintText,
    this.style,
  });

  @override
  State<GSSelect> createState() => _GSSelectState();
}

class _GSSelectState extends State<GSSelect> {
  String? selectedOption;
  bool _isHovered = false;
  int? hoveredIndex;
  String? selectedValue;
  OverlayEntry? overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _key = GlobalKey();
  static _GSSelectState? instance;

  @override
  void initState() {
    super.initState();
    instance = this;
  }

  void _removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GSStyleBuilder(
      child: Builder(builder: (context) {
        final selectVariant =
            widget.variant?.toGSVariant ?? selectTriggerStyle.props?.variant;
        final selectSize =
            widget.size?.toGSSize ?? selectTriggerStyle.props?.size;
        final textSize = widget.size?.toGSSize ?? selectTextStyle.props?.size;
        final iconSize = widget.size?.toGSSize ?? selectIconStyle.props?.size;
        final headerFontSize =
            widget.size?.toGSSize ?? selectSelectionHeaderTextStyle.props?.size;

        GSConfigStyle triggerStyler = resolveStyles(
          context: context,
          styles: [
            selectTriggerStyle,
            selectTriggerStyle.variantMap(selectVariant),
            selectTriggerStyle.sizeMap(selectSize),
          ],
          inlineStyle: widget.style,
        );

        GSConfigStyle textStyler = resolveStyles(
          context: context,
          styles: [
            gstextStyle,
            selectTextStyle,
            selectTextStyle.variantMap(selectVariant),
            selectTextStyle.sizeMap(textSize),
          ],
          inlineStyle: widget.style,
        );

        final iconStyler = resolveStyles(
          context: context,
          styles: [
            selectIconStyle,
            selectIconStyle.variantMap(selectVariant),
            selectIconStyle.sizeMap(iconSize),
          ],
          inlineStyle: widget.style,
        );

        final itemStyler = resolveStyles(
          context: context,
          styles: [
            selectItemStyle,
          ],
          inlineStyle: widget.style,
        );

        final contentStyler = resolveStyles(
          context: context,
          styles: [
            selectContentStyle,
          ],
          inlineStyle: widget.style,
        );

        final selectedInputStyler = resolveStyles(
          context: context,
          styles: [
            selectSelectedInputStyle,
          ],
          inlineStyle: widget.style,
        );

        final selectSelectionHeaderTextSStyler = resolveStyles(
          context: context,
          styles: [
            selectSelectionHeaderTextStyle,
          ],
          inlineStyle: widget.style,
        );

        Color? resolveBorderColor() {
          if (_isHovered) {
            return triggerStyler.onHover?.borderColor?.getColor(context) ??
                triggerStyler.borderColor?.getColor(context);
          } else {
            return triggerStyler.borderColor?.getColor(context);
          }
        }

        double? resolveBorderWidth() {
          if (_isHovered) {
            return triggerStyler.onHover?.borderWidth ??
                triggerStyler.borderWidth;
          } else {
            return triggerStyler.borderWidth;
          }
        }

        final borderColor = resolveBorderColor();
        final borderWidth = resolveBorderWidth();

        final currentTextStyle = textStyler.textStyle?.copyWith(
          fontFamily: textStyler.textStyle?.fontFamily,
          fontWeight: textStyler.textStyle?.fontWeight,
          fontStyle: textStyler.textStyle?.fontStyle,
          backgroundColor: textStyler.textStyle?.backgroundColor,
          overflow: textStyler.textStyle?.overflow,
          color: textStyler.color?.getColor(context) ??
              gstextStyle.color?.getColor(context),
        );

        void _toggleDropdown() {
          if (overlayEntry == null) {
            final renderBox =
                _key.currentContext!.findRenderObject() as RenderBox;
            final size = renderBox.size;
            final offset = renderBox.localToGlobal(Offset.zero);

            overlayEntry = OverlayEntry(
              builder: (context) => Stack(
                children: [
                  GestureDetector(
                    onTap: _removeOverlay,
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      color: Color.fromARGB(0, 151, 27, 27),
                    ),
                  ),
                  Positioned(
                    left: offset.dx,
                    top: offset.dy + size.height,
                    width: size.width,
                    child: CompositedTransformFollower(
                      link: _layerLink,
                      showWhenUnlinked: false,
                      child: Container(
                        color: contentStyler.bg?.getColor(context) ??
                            Color(0xFFE0E0E0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: _removeOverlay,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                color: contentStyler.bg?.getColor(context) ??
                                    const Color(0xFFE0E0E0),
                                child: Row(
                                  children: [
                                    if (selectedValue == null)
                                      Icon(
                                        CupertinoIcons.check_mark,
                                        size: iconStyler.height,
                                        color:
                                            textStyler.color?.getColor(context),
                                      ),
                                    if (selectedValue != null)
                                      Icon(
                                        CupertinoIcons.check_mark,
                                        size: iconStyler.height,
                                        color: contentStyler.bg
                                                ?.getColor(context) ??
                                            const Color(0xFFE0E0E0),
                                      ),
                                    const SizedBox(width: 8.0),
                                    Text(widget.hintText.text,
                                        style: currentTextStyle?.copyWith(
                                            color: textStyler.color
                                                ?.getColor(context)
                                                .withOpacity(selectedInputStyler
                                                        .onDisabled?.opacity ??
                                                    0.4))),
                                  ],
                                ),
                              ),
                            ),
                            ...widget.options.asMap().entries.map((entry) {
                              int index = entry.key;
                              String option = entry.value;
                              final isDisabled =
                                  widget.disabledOptions?.contains(option) ??
                                      false;
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return FocusableActionDetector(
                                  onShowHoverHighlight: (value) {
                                    setState(() {
                                      hoveredIndex = value ? index : null;
                                    });
                                  },
                                  child: GestureDetector(
                                    onTap: () {
                                      if (!isDisabled) {
                                        setState(() {
                                          selectedValue = option;
                                          _removeOverlay();
                                        });
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      color: selectedValue == option
                                          ? itemStyler.onActive?.bg
                                              ?.getColor(context)
                                          : hoveredIndex == index
                                              ? Color.fromARGB(255, 156, 158,
                                                  158) // Green color for hover
                                              : contentStyler.bg
                                                      ?.getColor(context) ??
                                                  Color(0xFFE0E0E0),
                                      child: Row(
                                        children: [
                                          if (selectedValue == option)
                                            Icon(
                                              CupertinoIcons.check_mark,
                                              size: iconStyler.height,
                                              color: textStyler.color
                                                  ?.getColor(context),
                                            ),
                                          if (selectedValue != option)
                                            Icon(
                                              CupertinoIcons.check_mark,
                                              size: iconStyler.height,
                                              color: contentStyler.bg
                                                      ?.getColor(context) ??
                                                  Color(0xFFE0E0E0),
                                            ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: Text(
                                              option,
                                              overflow: TextOverflow.ellipsis,
                                              style: currentTextStyle?.copyWith(
                                                color: isDisabled
                                                    ? textStyler.color
                                                        ?.getColor(context)
                                                        .withOpacity(
                                                            selectedInputStyler
                                                                    .onDisabled
                                                                    ?.opacity ??
                                                                0.4)
                                                    : textStyler.color
                                                            ?.getColor(
                                                                context) ??
                                                        gstextStyle.color
                                                            ?.getColor(context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                            }).toList(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );

            Overlay.of(context).insert(overlayEntry!);
          } else {
            _removeOverlay();
          }
        }

        return GSAncestor(
          decedentStyles: triggerStyler.descendantStyles,
          child: GSSelectProvider(
            fontSize: triggerStyler.textStyle?.fontSize,
            iconSize: iconSize,
            headerFontSize: headerFontSize,
            child: IntrinsicWidth(
              child: FocusableActionDetector(
                onShowHoverHighlight: (value) {
                  setState(() => _isHovered = value);
                },
                child: CompositedTransformTarget(
                  link: _layerLink,
                  child: GestureDetector(
                    key: _key,
                    onTap: _toggleDropdown,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      height: triggerStyler.height,
                      width: triggerStyler.width,
                      decoration: BoxDecoration(
                        color: triggerStyler.bg?.getColor(context),
                        border: widget.variant == GSSelectVariants.underlined
                            ? Border(
                                bottom: BorderSide(
                                  color: borderColor ??
                                      triggerStyler.borderColor!
                                          .getColor(context),
                                  width: borderWidth ??
                                      triggerStyler.borderBottomWidth ??
                                      0,
                                ),
                              )
                            : Border.all(
                                width: borderWidth ??
                                    triggerStyler.borderBottomWidth ??
                                    0,
                                color: borderColor ??
                                    triggerStyler.borderColor!
                                        .getColor(context),
                              ),
                        borderRadius: BorderRadius.circular(
                            triggerStyler.borderRadius ?? 0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (selectedValue != null)
                            Expanded(
                              child: Text(
                                selectedValue!,
                                overflow: TextOverflow.ellipsis,
                                style: currentTextStyle,
                              ),
                            )
                          else
                            widget.hintText,
                          const Spacer(),
                          widget.icon as Widget
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class CustomScaffold extends StatelessWidget {
  final Widget child;

  const CustomScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              final context = _GSSelectState.instance?.context;
              if (context != null) {
                _GSSelectState.instance?._removeOverlay();
              }
            },
            child: Container(
              color: Color.fromARGB(255, 145, 33, 33),
            ),
          ),
        ),
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}
