import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_progress/gs_progress_filled_track.dart';
import 'package:gluestack_ui/src/widgets/gs_progress/gs_progress_style.dart';

/// A widget that displays a progress bar, indicating the completion of a task or
/// the value of a process in a visually appealing manner. [GSProgress] supports
/// customizable styles, sizes, and progress values.
class GSProgress extends StatefulWidget {
  /// Custom [GSConfigStyle] to apply to the progress bar, enabling detailed customization
  /// of its appearance, including colors and other properties.
  final GSStyle? style;

  /// The size of the progress bar, affecting its overall dimensions. This can be set
  /// to one of the predefined [GSProgressSizes] values.
  final GSProgressSizes? size;

  /// The current value of the progress bar, expressed as a fraction between 0 and 1,
  /// where 1 indicates 100% completion.
  final double value;

  /// An optional semantic label for the progress bar, providing accessibility support
  /// by describing what the progress bar represents.
  final String? semanticsLabel;

  /// An optional semantic value for the progress bar, providing accessibility support
  /// by describing the current value of the progress in a readable format.
  final String? semanticsValue;
  const GSProgress({
    super.key,
    this.style,
    this.size,
    required this.value,
    this.semanticsLabel,
    this.semanticsValue,
  });

  @override
  State<GSProgress> createState() => _GSProgressState();
}

class _GSProgressState extends State<GSProgress> {
  static const fallBackValue = 200.0;
  double parentWidth = fallBackValue;
  final widgetKey = GlobalKey();

  void updateWidth() {
    /// Updates the width of the progress bar based on its parent's width.
    parentWidth = widgetKey.currentContext!.size?.width ?? -0;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // Schedule a callback to update the width after the layout phase.
    WidgetsBinding.instance.addPostFrameCallback((_) => updateWidth());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final progressSize = widget.size?.toGSSize ?? progressStyle.props?.size;
    // Resolve the GSStyle for the progress bar.
    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [progressStyle, progressStyle.sizeMap(progressSize)],
      inlineStyle: widget.style,
      isFirst: true,
    );

    final progressColor = styler.bg ?? progressStyle.bg;
    final borderRadius = styler.borderRadius;

    return GSAncestorProvider(
      decedentStyles: styler.descendantStyles,
      child: Semantics(
        label: widget.semanticsLabel,
        value: widget.semanticsValue,
        child: SizedBox(
          width: styler.width ?? fallBackValue,
          child: Stack(
            children: [
              // Background container.
              Container(
                key: widgetKey,
                decoration: BoxDecoration(
                  color: progressColor?.getColor(context),
                  borderRadius: BorderRadius.circular(borderRadius ?? 0),
                ),
                height: styler.height,
                width: styler.width ?? fallBackValue,
              ),
              // Animated foreground container showing progress.
              GSProgressFilledTrack(
                baseStyle: widget.style,
                parentWidth: parentWidth,
                value: widget.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
