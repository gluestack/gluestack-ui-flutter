import 'package:flutter/widgets.dart';

/// A widget that scales its child based on the current screen width, maintaining
/// the design's intended dimensions relative to a base design width. [GSRespScaler]
/// is useful for adapting UI elements designed for a specific screen width to
/// different screen sizes.
class GSRespScaler extends StatelessWidget {
  /// The child widget to scale. This can be any widget that needs to be adapted
  /// to the screen size while preserving its aspect ratio and layout proportions.
  final Widget child;

  /// The original design width that the [child] was designed for. This width is
  /// used as a reference point for scaling the child widget to match the current
  /// screen width. The default value is set to 375, a common width used in design
  /// tools like Figma for iPhone designs.
  final double ogDesignWidth;

  const GSRespScaler({
    super.key,
    required this.child,
    this.ogDesignWidth = 375, // Generic Figma design width for iPhone
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine the current screen width.
        double screenWidth = constraints.maxWidth;
        // Calculate the scale factor based on the current screen width and the original design width.
        double scaleFactor = screenWidth / ogDesignWidth;
        // Apply a minimum scale factor of 1 to ensure the child does not scale down on wider screens.
        return Transform.scale(
          // Scale the child widget according to the calculated scale factor.
          scale: scaleFactor < 1 ? 1 : scaleFactor,
          alignment: Alignment.topLeft,
          child: child,
        );
      },
    );
  }
}
