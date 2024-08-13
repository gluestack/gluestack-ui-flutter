import 'package:gluestack_ui/gluestack_ui.dart';

class SliderPainter extends CustomPainter {
  final double value;
  final double minValue;
  final double maxValue;
  final int? step;
  final bool reverse;
  final double length;
  final double thickness;
  final GSOrientations orientation;
  final double? trackWidth;
  final double? thumbHeight;
  final GSConfigStyle? filledTrackStyler;
  final GSConfigStyle? trackStyler;
  final BuildContext context;
  final GSConfigStyle? thumbStyler;
  final GSConfigStyle styler;

  SliderPainter({
    required this.value,
    required this.minValue,
    required this.maxValue,
    this.step,
    required this.reverse,
    required this.length,
    required this.thickness,
    required this.orientation,
    required this.trackWidth,
    this.filledTrackStyler,
    required this.context,
    this.trackStyler,
    this.thumbStyler,
    required this.styler,
    required this.thumbHeight,
  });

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {
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
    final double thumbRadius = (thumbHeight ?? 20.0) / 2;

    // Adjust trackStart and trackEnd to accommodate the thumb radius
    final double trackStart = thumbRadius;
    final double trackEnd = length - thumbRadius;

    // Calculate the thumb position on the track
    final double thumbPos =
        ((value - minValue) / (maxValue - minValue)) * (trackEnd - trackStart) + trackStart;

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
}
