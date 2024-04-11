import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_a_item_internal.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_accordian_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_group_value.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

/// Defines the behavior types of the accordion: single (only one item can be expanded at a time) or multiple (multiple items can be expanded).
enum GSAccordionTypes { single, multiple }

/// A customizable gluestack accordion widget that allows for collapsible content sections.
/// This widget supports various sizes, types, and visual variants, and can be further customized with icons and styles.
class GSAccordion extends StatefulWidget {
  /// Custom style for the accordion. If null, the default style is applied.
  final GSStyle? style;

  /// The list of items to display within the accordion.
  final List<GSAccordionItem> children;

  /// Optional initial expansion state for each accordion item. A value of true indicates the item should be initially expanded.
  final List<bool>? initialValues;

  /// The size of the accordion, affecting its content's font size. Defaults to $md.
  final GSAccordionSizes? size;

  /// The accordion's behavior type, determining whether single or multiple items can be expanded simultaneously.
  final GSAccordionTypes? type;

  /// The visual variant of the accordion, affecting its background and border styles.
  final GSAccordionVariants? variant;

  /// Whether the accordion is disabled. If true, all interactions are disabled.
  final bool? isDisabled;

  /// Whether the accordion items are collapsible. If false, expanded items cannot be collapsed.
  final bool? isCollapsible;

  /// The duration of the animation when expanding or collapsing an item.
  final Duration? animationDuration;

  /// Optional icon displayed next to the title when an item is expanded.
  final GSAccordionIcon? suffixIconWhenTileExpanded;

  /// Optional icon displayed next to the title when an item is collapsed.
  final GSAccordionIcon? suffixIconWhenTileCollapsed;

  /// Whether to show the suffix icon. Defaults to true.
  final bool? showSuffixIcon;

  /// Optional icon displayed before the title when an item is collapsed.
  final GSAccordionIcon? prefixIconWhenTileCollapsed;

  /// Optional icon displayed before the title when an item is expanded.
  final GSAccordionIcon? prefixIconWhenTileExapanded;

  /// Padding applied around the prefix icon.
  final EdgeInsets? prefixIconPadding;

  /// Padding applied around each accordion item.
  final EdgeInsets? itemPadding;

  /// Constructs a GSAccordion widget.
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

    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: GSAccordionProvider(
        // refresh: true,
        isCollapsible: widget.isCollapsible!,
        isDisabled: widget.isDisabled!,
        type: widget.type!,
        size: widget.size!,

        accGrpValue: accGroupValue,

        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: styler.shadowRadius ?? 0,
                color: styler.shadowColor
                        ?.withOpacity(styler.shadowOpacity ?? 0) ??
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
                      contentStyle: styler.descendantStyles!["_contentText"],
                      headerStyle: styler.descendantStyles!["_titleText"],
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
                      accordionbackground: styler.bg,
                      iconColor: styler.iconColor,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
