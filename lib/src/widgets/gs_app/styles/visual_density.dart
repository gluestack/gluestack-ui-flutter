import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class GSVisualDensity with Diagnosticable {
  /// A const constructor for [GSVisualDensity].
  ///
  /// The [horizontal] and [vertical] arguments must be in the interval between
  /// [minimumDensity] and [maximumDensity], inclusive.
  const GSVisualDensity({
    this.horizontal = 0.0,
    this.vertical = 0.0,
  })  : assert(vertical <= maximumDensity),
        assert(vertical <= maximumDensity),
        assert(vertical >= minimumDensity),
        assert(horizontal <= maximumDensity),
        assert(horizontal >= minimumDensity);

  /// The minimum allowed density.
  static const double minimumDensity = -4.0;

  /// The maximum allowed density.
  static const double maximumDensity = 4.0;

  /// The default profile for [GSVisualDensity] in [ThemeData].
  ///
  /// This default value represents a visual density that is less dense than
  /// either [comfortable] or [compact], and corresponds to density values of
  /// zero in both axes.
  static const GSVisualDensity standard = GSVisualDensity();

  /// The profile for a "comfortable" interpretation of [GSVisualDensity].
  ///
  /// Individual components will interpret the density value independently,
  /// making themselves more visually dense than [standard] and less dense than
  /// [compact] to different degrees based on the Material Design specification
  /// of the "comfortable" setting for their particular use case.
  ///
  /// It corresponds to a density value of -1 in both axes.
  static const GSVisualDensity comfortable =
      GSVisualDensity(horizontal: -1.0, vertical: -1.0);

  /// The profile for a "compact" interpretation of [GSVisualDensity].
  ///
  /// Individual components will interpret the density value independently,
  /// making themselves more visually dense than [standard] and [comfortable] to
  /// different degrees based on the Material Design specification of the
  /// "comfortable" setting for their particular use case.
  ///
  /// It corresponds to a density value of -2 in both axes.
  static const GSVisualDensity compact =
      GSVisualDensity(horizontal: -2.0, vertical: -2.0);

  /// Returns a [GSVisualDensity] that is adaptive based on the current platform
  /// on which the framework is executing, from [defaultTargetPlatform].
  ///
  /// When [defaultTargetPlatform] is a desktop platform, this returns
  /// [compact], and for other platforms, it returns a default-constructed
  /// [GSVisualDensity].
  ///
  /// See also:
  ///
  /// * [defaultDensityForPlatform] which returns a [GSVisualDensity] that is
  ///   adaptive based on the platform given to it.
  /// * [defaultTargetPlatform] which returns the platform on which the
  ///   framework is currently executing.
  static GSVisualDensity get adaptivePlatformDensity =>
      defaultDensityForPlatform(defaultTargetPlatform);

  /// Returns a [GSVisualDensity] that is adaptive based on the given [platform].
  ///
  /// For desktop platforms, this returns [compact], and for other platforms, it
  /// returns a default-constructed [GSVisualDensity].
  ///
  /// See also:
  ///
  /// * [adaptivePlatformDensity] which returns a [GSVisualDensity] that is
  ///   adaptive based on [defaultTargetPlatform].
  static GSVisualDensity defaultDensityForPlatform(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        break;
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return compact;
    }
    return GSVisualDensity.standard;
  }

  /// Copy the current [GSVisualDensity] with the given values replacing the
  /// current values.
  GSVisualDensity copyWith({
    double? horizontal,
    double? vertical,
  }) {
    return GSVisualDensity(
      horizontal: horizontal ?? this.horizontal,
      vertical: vertical ?? this.vertical,
    );
  }

  /// The horizontal visual density of UI components.
  ///
  /// This property affects only the horizontal spacing between and within
  /// components, to allow for different UI visual densities. It does not affect
  /// text sizes, icon sizes, or padding values. The default value is 0.0,
  /// corresponding to the metrics specified in the Material Design
  /// specification. The value can range from [minimumDensity] to
  /// [maximumDensity], inclusive.
  ///
  /// See also:
  ///
  ///  * [ThemeData.GSVisualDensity], where this property is used to specify the base
  ///    horizontal density of Material components.
  ///  * [Material design guidance on density](https://material.io/design/layout/applying-density.html).
  final double horizontal;

  /// The vertical visual density of UI components.
  ///
  /// This property affects only the vertical spacing between and within
  /// components, to allow for different UI visual densities. It does not affect
  /// text sizes, icon sizes, or padding values. The default value is 0.0,
  /// corresponding to the metrics specified in the Material Design
  /// specification. The value can range from [minimumDensity] to
  /// [maximumDensity], inclusive.
  ///
  /// See also:
  ///
  ///  * [ThemeData.GSVisualDensity], where this property is used to specify the base
  ///    vertical density of Material components.
  ///  * [Material design guidance on density](https://material.io/design/layout/applying-density.html).
  final double vertical;

  /// The base adjustment in logical pixels of the visual density of UI components.
  ///
  /// The input density values are multiplied by a constant to arrive at a base
  /// size adjustment that fits Material Design guidelines.
  ///
  /// Individual components may adjust this value based upon their own
  /// individual interpretation of density.
  Offset get baseSizeAdjustment {
    // The number of logical pixels represented by an increase or decrease in
    // density by one. The Material Design guidelines say to increment/decrement
    // sizes in terms of four pixel increments.
    const double interval = 4.0;

    return Offset(horizontal, vertical) * interval;
  }

  /// Linearly interpolate between two densities.
  static GSVisualDensity lerp(GSVisualDensity a, GSVisualDensity b, double t) {
    if (identical(a, b)) {
      return a;
    }
    return GSVisualDensity(
      horizontal: lerpDouble(a.horizontal, b.horizontal, t)!,
      vertical: lerpDouble(a.vertical, b.vertical, t)!,
    );
  }

  /// Return a copy of [constraints] whose minimum width and height have been
  /// updated with the [baseSizeAdjustment].
  ///
  /// The resulting minWidth and minHeight values are clamped to not exceed the
  /// maxWidth and maxHeight values, respectively.
  BoxConstraints effectiveConstraints(BoxConstraints constraints) {
    assert(constraints.debugAssertIsValid());
    return constraints.copyWith(
      minWidth: clampDouble(constraints.minWidth + baseSizeAdjustment.dx, 0.0,
          constraints.maxWidth),
      minHeight: clampDouble(constraints.minHeight + baseSizeAdjustment.dy, 0.0,
          constraints.maxHeight),
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is GSVisualDensity &&
        other.horizontal == horizontal &&
        other.vertical == vertical;
  }

  @override
  int get hashCode => Object.hash(horizontal, vertical);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('horizontal', horizontal, defaultValue: 0.0));
    properties.add(DoubleProperty('vertical', vertical, defaultValue: 0.0));
  }

  @override
  String toStringShort() {
    return '${super.toStringShort()}(h: ${debugFormatDouble(horizontal)}, v: ${debugFormatDouble(vertical)})';
  }
}
