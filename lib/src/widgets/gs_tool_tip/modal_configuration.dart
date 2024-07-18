import 'package:flutter/material.dart';

/// Configures the [Modal] widget
class ModalConfiguration {
  const ModalConfiguration({
    this.color = Colors.black87,
    this.opacity = 0.7,
  });

  /// [color] Background color of the fullscreen background modal
  /// The default value is Colors.black87
  final Color color;

  /// [opacity] Opacity of the fullscreen background modal
  /// The default value is 0.7
  final double opacity;
}
