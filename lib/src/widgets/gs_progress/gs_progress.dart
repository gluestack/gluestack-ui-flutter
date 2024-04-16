import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/public.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_progress/gs_progress_style.dart';

/// Provides predefined sizes for GS Progress widget
enum GSProgressSizes {
  $xs,
  $sm,
  $md,
  $lg,
  $xl,
  $2xl,
}

/// A widget that displays a progress bar, indicating the completion of a task or
/// the value of a process in a visually appealing manner. [GSProgress] supports
/// customizable styles, sizes, and progress values.
class GSProgress extends StatefulWidget {
  /// Custom [GSStyle] to apply to the progress bar, enabling detailed customization
  /// of its appearance, including colors and other properties.
  final GSStyle? style;

  /// The size of the progress bar, affecting its overall dimensions. This can be set
  /// to one of the predefined [GSProgressSizes] values.
  final GSProgressSizes? size;

  /// The current value of the progress bar, expressed as a fraction between 0 and 1,
  /// where 1 indicates 100% completion.
  final double? value;

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
    this.value = 0,
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
    GSStyle styler = resolveStyles(
      context: context,
      styles: [progressStyle, progressStyle.sizeMap(progressSize)],
      inlineStyle: widget.style,
      isFirst: true,
    );


    final valueColor = styler.progressValueColor ?? $GSColors.primary500;
    final borderRadius = styler.borderRadius ?? progressStyle.borderRadius;

    return Semantics(
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
                color: styler.bg,
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
              height: styler.height,
              width: styler.width ?? fallBackValue,
            ),
            // Animated foreground container showing progress.
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: styler.width != double.infinity && styler.width != null
                  ? styler.width! * widget.value!
                  : parentWidth * widget.value!,
              height: styler.height,
              decoration: BoxDecoration(
                color: valueColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            )
          ],
        ),
      ),
    );
  }
}
