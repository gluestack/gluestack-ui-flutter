import 'package:flutter/widgets.dart';

class SliderPainter extends CustomPainter {
  final double value;
  final double min;
  final double max;
  final int? divisions;
  final bool reverse;
  final double length;
  final double thickness;
  final String orientation;
  final double? trackWidth;
  final double? thumbHeight;
  // final GSConfigStyle? filledTrackStyler;
  // final GSConfigStyle? trackStyler;
  final BuildContext context;
  // final GSConfigStyle? thumbStyler;
  // final GSConfigStyle styler;
  final Color filledTrackColor;
  final Color unfilledTrackColor;
  final Color thumbColor;

  SliderPainter(
      {required this.value,
      required this.min,
      required this.max,
      this.divisions,
      required this.reverse,
      required this.length,
      required this.thickness,
      required this.orientation,
      required this.trackWidth,
      // this.filledTrackStyler,
      required this.context,
      // this.trackStyler,
      // this.thumbStyler,
      // required this.styler,
      required this.thumbHeight,
      required this.thumbColor,
      required this.filledTrackColor,
      required this.unfilledTrackColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint filledTrackPaint = Paint()
      ..color = filledTrackColor
      // (styler.trackColorTrue?.getColor(context) ??
      //     filledTrackStyler?.bg?.getColor(context) ??
      //     GSTheme.of(context).background100)!
      ..strokeWidth = trackWidth ?? 5.0
      ..strokeCap = StrokeCap.round;

    final Paint unfilledTrackPaint = Paint()
      ..color = unfilledTrackColor
      // styler.trackColorFalse?.getColor(context) ??
      //     trackStyler?.bg?.getColor(context) ??
      //     GSTheme.of(context).background100!
      ..strokeWidth = trackWidth ?? 5.0
      ..strokeCap = StrokeCap.round;

    final Paint thumbPaint = Paint()
      ..color = thumbColor
      //  styler.thumbColor?.getColor(context) ??
      //     thumbStyler?.bg?.getColor(context) ??
      //     GSTheme.of(context).background600!
      ..style = PaintingStyle.fill;

    // Calculate thumb radius
    final double thumbRadius = (thumbHeight ?? 20.0) / 2;

    // Adjust trackStart and trackEnd to accommodate the thumb radius
    final double trackStart = thumbRadius;
    final double trackEnd = length - thumbRadius;

    // Calculate the thumb position on the track
    final double thumbPos =
        ((value - min) / (max - min)) * (trackEnd - trackStart) + trackStart;

    // Adjust the thumb position if the slider is reversed
    final double adjustedThumbPos =
        reverse ? trackEnd - (thumbPos - trackStart) : thumbPos;

    if (orientation == "horizontal") {
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
