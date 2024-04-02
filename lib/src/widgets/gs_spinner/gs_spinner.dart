import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/public.dart';
import 'package:gluestack_ui/src/widgets/gs_spinner/gs_spinner_painter.dart';
import 'package:gluestack_ui/src/widgets/gs_spinner/gs_spinner_style.dart';

/// PRedefined sizes for the [GSSpinner] widget
enum GSSpinnerSizes { small, large }

/// A widget that displays a circular loading spinner with customizable size, stroke width,
/// color, and animation duration. Suitable for indicating loading states in the UI.
class GSSpinner extends StatefulWidget {
  /// Custom [GSStyle] to apply to the spinner, enabling detailed customization of its appearance,
  /// including color and dimensions.
  final GSStyle? style;

  /// The size of the spinner, affecting its overall dimensions. This can be set to one of
  /// the predefined [GSSpinnerSizes] values, altering the spinner's size.
  final GSSpinnerSizes? size;

  /// The width of the spinner's stroke. This determines how thick the circular progress line appears.
  final double strokeWidth;

  /// The duration of a complete spin cycle. This controls the speed of the spinner's animation.
  final Duration duration;

  /// An optional semantic label for the spinner, providing accessibility support by describing
  /// what the spinner represents.
  final String? semanticsLabel;

  /// An optional semantic value for the spinner, providing accessibility support by describing
  /// the current value or state of the spinner in a readable format.
  final String? semanticsValue;

  /// The length of the arc drawn by the spinner. This value determines how much of the circle
  /// is filled by the spinner's stroke as it rotates.
  final double arcLength;

  const GSSpinner({
    super.key,
    this.style,
    this.size = GSSpinnerSizes.large,
    this.strokeWidth = 4.0,
    this.duration = const Duration(seconds: 1),
    this.semanticsLabel,
    this.semanticsValue,
    this.arcLength = 2,
  });

  @override
  GSSpinnerState createState() => GSSpinnerState();
}

class GSSpinnerState extends State<GSSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Resolve the GSStyle for the spinner.
    spinnerStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().spinner);
    GSStyle styler = resolveStyles(
      context: context,
      styles: [spinnerStyle],
      inlineStyle: widget.style,
      isFirst: true,
    );
    double sizeVal = 40;
    if (widget.size! == GSSpinnerSizes.small) {
      sizeVal = 20;
    }
    final size = Size(styler.width ?? sizeVal, styler.height ?? sizeVal);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            CustomPaint(
              painter: SpinnerPainter(
                arcLength: 10,
                progress: 1,
                color: styler.bg ?? $GSColors.primary300,
                strokeWidth: widget.strokeWidth,
              ),
              size: size,
            ),
            CustomPaint(
              painter: SpinnerPainter(
                arcLength: widget.arcLength,
                progress: _controller.value,
                color: styler.color ??
                    spinnerStyle.props?.color ??
                    $GSColors.primary600,
                strokeWidth: widget.strokeWidth,
              ),
              size: size,
            ),
          ],
        );
      },
    );
  }
}
