import 'package:flutter/services.dart';
import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_slider/gs_slider_filled_track_style.dart';
import 'package:gluestack_ui/src/widgets/gs_slider/gs_slider_style.dart';
import 'package:gluestack_ui/src/widgets/gs_slider/gs_slider_thumb_style.dart';
import 'package:gluestack_ui/src/widgets/gs_slider/gs_slider_track_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';

class GSSlider extends StatefulWidget {
  final bool isReversed;
  final bool isDisabled;
  final double max;
  final double min;
  final GSSliderSizes? size;
  final GSOrientations? orientation;
  final GSStyle? style;
  final ValueChanged<double>? onChanged;
  final int? divisions;

  const GSSlider({
    super.key,
    this.style,
    this.size,
    this.min = 0,
    this.max = 10,
    this.isReversed = false,
    this.isDisabled = false,
    this.orientation = GSOrientations.horizontal,
    this.onChanged,
    this.divisions,
  });

  @override
  State<GSSlider> createState() => _GSSliderState();
}

class _GSSliderState extends State<GSSlider> {
  late double _currentValue;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.min;
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sliderSize = widget.size?.toGSSize ?? sliderStyle.props?.size;
    final sliderOrientation =
        widget.orientation ?? sliderStyle.props?.orientation;

    return GSStyleBuilder(
      isDisabled: widget.isDisabled,
      child: Builder(
        builder: (context) {
          GSConfigStyle styler = resolveStyles(
            context: context,
            styles: [
              sliderStyle,
              sliderStyle.sizeMap(sliderSize),
              sliderStyle.compoundVariants?[
                  sliderOrientation.toString() + sliderSize.toString()]
            ],
            inlineStyle: widget.style,
          );

          GSConfigStyle thumbStyler = resolveStyles(
            context: context,
            styles: [sliderThumbStyle],
            inlineStyle: widget.style,
          );

          GSConfigStyle trackStyler = resolveStyles(
            context: context,
            styles: [sliderTrackStyle],
            inlineStyle: widget.style,
          );

          GSConfigStyle filledTrackStyler = resolveStyles(
            context: context,
            styles: [sliderFilledTrackStyle],
            inlineStyle: widget.style,
          );

          void updateValue(double newValue) {
            setState(() {
              if (widget.divisions != null) {
                final int divisions = widget.divisions!;
                final double divisionWidth =
                    (widget.max - widget.min) / divisions;
                _currentValue =
                    ((newValue / divisionWidth).round() * divisionWidth)
                        .clamp(widget.min, widget.max);
              } else {
                _currentValue = newValue.clamp(widget.min, widget.max);
              }
              if (widget.onChanged != null) {
                widget.onChanged!(_currentValue);
              }
            });
          }

          void handleKeyEvent(KeyEvent event) {
            if (event is KeyDownEvent) {
              final double step = widget.divisions != null
                  ? (widget.max - widget.min) / widget.divisions!
                  : (widget.max - widget.min) / 100;
              if (event.logicalKey == LogicalKeyboardKey.arrowRight ||
                  event.logicalKey == LogicalKeyboardKey.arrowUp) {
                updateValue(_currentValue + (widget.isReversed ? -step : step));
              } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
                  event.logicalKey == LogicalKeyboardKey.arrowDown) {
                updateValue(_currentValue + (widget.isReversed ? step : -step));
              }
            }
          }

          void handleDragUpdate(DragUpdateDetails details, double length) {
            double delta = widget.orientation == GSOrientations.horizontal
                ? details.localPosition.dx
                : details.localPosition.dy;
            if (widget.isReversed) {
              delta = length - delta;
            }
            final double newValue =
                (delta / length) * (widget.max - widget.min) + widget.min;
            updateValue(newValue);
          }

          void handleTapDown(TapDownDetails details, double length) {
            double delta = widget.orientation == GSOrientations.horizontal
                ? details.localPosition.dx
                : details.localPosition.dy;
            if (widget.isReversed) {
              delta = length - delta;
            }
            final double newValue =
                (delta / length) * (widget.max - widget.min) + widget.min;
            updateValue(newValue);
          }

          return GSAncestor(
            decedentStyles: styler.descendantStyles,
            child: Directionality(
              textDirection: widget.isReversed &&
                      widget.orientation == GSOrientations.horizontal
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: Opacity(
                opacity: widget.isDisabled ? 0.6 : 1,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double length =
                        widget.orientation == GSOrientations.horizontal
                            ? (styler.trackWidth ?? constraints.maxWidth)
                                .clamp(0.0, constraints.maxWidth)
                            : (styler.trackHeight ?? constraints.maxHeight)
                                .clamp(0.0, constraints.maxHeight);
                    if (length == double.infinity) {
                      length = styler.trackHeight ?? 200;
                    }
                    final double thickness = styler.thumbHeight ?? 20.00;
                    return Focus(
                      focusNode: _focusNode,
                      onKeyEvent: (FocusNode node, KeyEvent event) {
                        handleKeyEvent(event);
                        return KeyEventResult.handled;
                      },
                      child: GestureDetector(
                        onHorizontalDragUpdate: widget.isDisabled ||
                                widget.orientation == GSOrientations.vertical
                            ? null
                            : (details) {
                                _focusNode.requestFocus();
                                handleDragUpdate(details, length);
                              },
                        onVerticalDragUpdate: widget.isDisabled ||
                                widget.orientation == GSOrientations.horizontal
                            ? null
                            : (details) {
                                _focusNode.requestFocus();
                                handleDragUpdate(details, length);
                              },
                        onTapDown: widget.isDisabled
                            ? null
                            : (details) {
                                _focusNode.requestFocus();
                                handleTapDown(details, length);
                              },
                        child: CustomPaint(
                          size: widget.orientation == GSOrientations.horizontal
                              ? Size(length, thickness)
                              : Size(thickness, length),
                          painter: _SliderPainter(
                            context: context,
                            styler: styler,
                            filledTrackStyler: filledTrackStyler,
                            trackStyler: trackStyler,
                            thumbStyler: thumbStyler,
                            value: _currentValue,
                            min: widget.min,
                            max: widget.max,
                            divisions: widget.divisions,
                            reverse: widget.isReversed,
                            length: length,
                            thickness: thickness,
                            orientation: widget.orientation!,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SliderPainter extends CustomPainter {
  final double value;
  final double min;
  final double max;
  final int? divisions;
  final bool reverse;
  final double length;
  final double thickness;
  final GSOrientations orientation;
  final GSConfigStyle? filledTrackStyler;
  final GSConfigStyle? trackStyler;
  final BuildContext context;
  final GSConfigStyle? thumbStyler;
  final GSConfigStyle styler;

  _SliderPainter({
    required this.value,
    required this.min,
    required this.max,
    this.divisions,
    required this.reverse,
    required this.length,
    required this.thickness,
    required this.orientation,
    this.filledTrackStyler,
    required this.context,
    this.trackStyler,
    this.thumbStyler,
    required this.styler,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double? trackWidth = orientation == GSOrientations.horizontal
        ? styler.trackHeight
        : styler.trackWidth ?? 5;

    final Paint filledTrackPaint = Paint()
      ..color = (styler.trackColorTrue?.getColor(context) ??
          filledTrackStyler?.bg?.getColor(context) ??
          GSTheme.of(context).background100)!
      ..strokeWidth = trackWidth ?? 5.0
      ..strokeCap = StrokeCap.round;

    final Paint unfilledTrackPaint = Paint()
      ..color = styler.trackColorFalse?.getColor(context) ??
          trackStyler?.bg?.getColor(context) ??
          GSTheme.of(context).background100!
      ..strokeWidth = trackWidth ?? 5.0
      ..strokeCap = StrokeCap.round;

    final Paint thumbPaint = Paint()
      ..color = styler.thumbColor?.getColor(context) ??
          thumbStyler?.bg?.getColor(context) ??
          GSTheme.of(context).background600!
      ..style = PaintingStyle.fill;

    // Calculate thumb radius
    final double thumbRadius = (styler.thumbHeight ?? 20.0) / 2;

    // Adjust trackStart and trackEnd to accommodate the thumb radius
    final double trackStart = thumbRadius;
    final double trackEnd = length - thumbRadius;

    // Calculate the thumb position on the track
    final double thumbPos =
        ((value - min) / (max - min)) * (trackEnd - trackStart) + trackStart;

    // Adjust the thumb position if the slider is reversed
    final double adjustedThumbPos =
        reverse ? trackEnd - (thumbPos - trackStart) : thumbPos;

    if (orientation == GSOrientations.horizontal) {
      if (reverse) {
        // Draw the filled track
        canvas.drawLine(
          Offset(adjustedThumbPos, thickness / 2),
          Offset(trackEnd, thickness / 2),
          filledTrackPaint,
        );

        // Draw the unfilled track
        canvas.drawLine(
          Offset(trackStart, thickness / 2),
          Offset(adjustedThumbPos, thickness / 2),
          unfilledTrackPaint,
        );
      } else {
        // Draw the filled track
        canvas.drawLine(
          Offset(trackStart, thickness / 2),
          Offset(adjustedThumbPos, thickness / 2),
          filledTrackPaint,
        );

        // Draw the unfilled track
        canvas.drawLine(
          Offset(adjustedThumbPos, thickness / 2),
          Offset(trackEnd, thickness / 2),
          unfilledTrackPaint,
        );
      }

      // Draw the thumb
      canvas.drawCircle(
        Offset(adjustedThumbPos, thickness / 2),
        thumbRadius,
        thumbPaint,
      );
    } else {
      if (reverse) {
        // Draw the filled track
        canvas.drawLine(
          Offset(thickness / 2, adjustedThumbPos),
          Offset(thickness / 2, trackEnd),
          filledTrackPaint,
        );

        // Draw the unfilled track
        canvas.drawLine(
          Offset(thickness / 2, trackStart),
          Offset(thickness / 2, adjustedThumbPos),
          unfilledTrackPaint,
        );
      } else {
        // Draw the filled track
        canvas.drawLine(
          Offset(thickness / 2, trackStart),
          Offset(thickness / 2, adjustedThumbPos),
          filledTrackPaint,
        );

        // Draw the unfilled track
        canvas.drawLine(
          Offset(thickness / 2, adjustedThumbPos),
          Offset(thickness / 2, trackEnd),
          unfilledTrackPaint,
        );
      }

      // Draw the thumb
      canvas.drawCircle(
        Offset(thickness / 2, adjustedThumbPos),
        thumbRadius,
        thumbPaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
