import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/public.dart';
import 'package:gluestack_ui/src/widgets/gs_spinner/gs_spinner_painter.dart';
import 'package:gluestack_ui/src/widgets/gs_spinner/gs_spinner_style.dart';

enum GSSpinnerSizes { small, large }

class GSSpinner extends StatefulWidget {
  final GSStyle? style;
  final GSSpinnerSizes? size;
  final double strokeWidth;
  final Duration duration;
  final String? semanticsLabel;
  final String? semanticsValue;
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
