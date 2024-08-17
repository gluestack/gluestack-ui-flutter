import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_icon_style.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_selection_header_text_style.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_text_style.dart';
import 'package:gluestack_ui/src/widgets/gs_select/gs_select_trigger_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_text/gs_text_style.dart';

class GSSelect extends StatefulWidget {
  final GSSelectSizes? size;
  final GSSelectVariants? variant;
  final GSStyle? style;
  final GSSelectHeaderText label;
  final GSSelectIcon icon;
  final GSSelectContent content;
  final ValueChanged<String>? onValueChange;
  final bool isDisabled;
  final bool closeOnOverlayClick;
  final Function()? onClose;
  final Function()? onOpen;
  final String? initialLabel;

  const GSSelect({
    super.key,
    this.size,
    this.variant,
    required this.icon,
    required this.label,
    this.style,
    this.onValueChange,
    this.isDisabled = false,
    this.closeOnOverlayClick = true,
    required this.content,
    this.onClose,
    this.onOpen,
    this.initialLabel,
  });

  @override
  State<GSSelect> createState() => _GSSelectState();
}

class _GSSelectState extends State<GSSelect> {
  String? selectedOption;
  bool _isHovered = false;
  int? hoveredIndex;
  OverlayEntry? overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _key = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _itemKeys = {};

  @override
  void initState() {
    super.initState();
    if (widget.initialLabel != null &&
        widget.content.options.contains(widget.initialLabel)) {
      selectedOption = widget.initialLabel;
    }
  }

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
    hoveredIndex = null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.onClose != null) {
        widget.onClose!();
      }
    });
  }

  void _selectOption(String option) {
    setState(() {
      selectedOption = option;
      removeOverlay();
      if (widget.onValueChange != null) {
        widget.onValueChange!(option);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  int? _getSelectedOptionIndex() {
    if (selectedOption == null) return null;
    return widget.content.options.indexOf(selectedOption!);
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
          decoration: textStyler.textStyle?.decoration ?? TextDecoration.none,
          fontFamily: textStyler.textStyle?.fontFamily,
          fontWeight: textStyler.textStyle?.fontWeight,
          fontStyle: textStyler.textStyle?.fontStyle,
          backgroundColor: textStyler.textStyle?.backgroundColor,
          overflow: textStyler.textStyle?.overflow,
          color: textStyler.color?.getColor(context) ??
              gstextStyle.color?.getColor(context),
        );

        void toggleDropdown() {
          if (overlayEntry == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (widget.onOpen != null) {
                widget.onOpen!();
              }
            });
            final renderBox =
                _key.currentContext!.findRenderObject() as RenderBox;
            final size = renderBox.size;
            final offset = renderBox.localToGlobal(Offset.zero);

            overlayEntry = OverlayEntry(
              builder: (context) => Stack(
                children: [
                  GestureDetector(
                    onTap: widget.closeOnOverlayClick ? removeOverlay : null,
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      color: const Color.fromARGB(0, 228, 9, 9),
                    ),
                  ),
                  Positioned(
                    left: offset.dx,
                    top: offset.dy + size.height,
                    width: size.width,
                    child: CompositedTransformFollower(
                      link: _layerLink,
                      showWhenUnlinked: false,
                      child: GSSelectProvider(
                        fontSize: triggerStyler.textStyle?.fontSize,
                        iconSize: iconSize,
                        scrollController: _scrollController,
                        selectVariant: selectVariant,
                        headerFontSize: headerFontSize,
                        textSize: textSize,
                        selectedOption: selectedOption,
                        removeOverlay: removeOverlay,
                        label: widget.label.text.toString(),
                        itemKeys: _itemKeys,
                        hoveredIndex: hoveredIndex,
                        selectOption: _selectOption,
                        currentTextStyle: currentTextStyle,
                        style: widget.style,
                        child: widget.content,
                      ),
                    ),
                  ),
                ],
              ),
            );

            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (_scrollController.hasClients) {
                int? selectedIndex = _getSelectedOptionIndex();
                if (selectedIndex != null && selectedIndex > 0) {
                  final selectedKey =
                      _itemKeys[widget.content.options[selectedIndex]];
                  if (selectedKey?.currentContext != null) {
                    Scrollable.ensureVisible(selectedKey!.currentContext!,
                        alignment: 0.5,
                        duration: const Duration(milliseconds: 300));
                  }
                }
              }
            });

            Overlay.of(context).insert(overlayEntry!);
          } else {
            removeOverlay();
          }
        }

        return GSAncestor(
          decedentStyles: triggerStyler.descendantStyles,
          child: Opacity(
            opacity: widget.isDisabled == true ? 0.7 : 1,
            child: IntrinsicWidth(
              child: FocusableActionDetector(
                onShowHoverHighlight: (value) {
                  widget.isDisabled == true
                      ? null
                      : setState(() => _isHovered = value);
                },
                child: CompositedTransformTarget(
                  link: _layerLink,
                  child: GsGestureDetector(
                    key: _key,
                    onPressed:
                        widget.isDisabled == true ? null : toggleDropdown,
                    child: Container(
                      padding: widget.style?.padding ??
                          triggerStyler.padding ??
                          const EdgeInsets.symmetric(horizontal: 15),
                      height: triggerStyler.height,
                      width: triggerStyler.width,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(0, 0, 0, 0),
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
                      child: GSSelectProvider(
                        fontSize: triggerStyler.textStyle?.fontSize,
                        iconSize: iconSize,
                        headerFontSize: headerFontSize,
                        selectOption: (String option) {},
                        removeOverlay: removeOverlay,
                        scrollController: _scrollController,
                        itemKeys: _itemKeys,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (selectedOption != null)
                              Expanded(
                                child: Text(
                                  selectedOption!,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: currentTextStyle,
                                ),
                              )
                            else
                              widget.label,
                            widget.icon
                          ],
                        ),
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
