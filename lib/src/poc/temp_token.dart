//! Radii Token

import 'dart:developer';

import 'package:gluestack_ui/gluestack_ui.dart';

class GSRadiiToken2 {
  final String none;
  final String $xs;
  final String $sm;
  final String $md;
  final String $lg;
  final String $xl;
  final String $2xl;
  final String $3xl;
  final String full;

  const GSRadiiToken2({
    this.none = 'none',
    this.$xs = 'xs',
    this.$sm = 'sm',
    this.$md = 'md',
    this.$lg = 'lg',
    this.$xl = 'xl',
    this.$2xl = '2xl',
    this.$3xl = '3xl',
    this.full = 'full',
  });
}

class $GSRadii2 {
  static get none => radiiInstance.none;
  static get $xs => radiiInstance.$xs;
  static get $sm => radiiInstance.$sm;
  static get $md => radiiInstance.$md;
  static get $lg => radiiInstance.$lg;
  static get $xl => radiiInstance.$xl;
  static get $2xl => radiiInstance.$2xl;
  static get $3xl => radiiInstance.$3xl;
  static get full => radiiInstance.full;

  static Map<String, double> radiiMap = {
    "none": none,
    "xs": $xs,
    "sm": $sm,
    "md": $md,
    "lg": $lg,
    "xl": $xl,
    "2xl": $2xl,
    "3xl": $3xl,
    "full": full,
  };

  static double getRealValue(String token) {
    log('Token: $token');
    return realValue[token] ?? 0;
  }

  static Map<String, double> realValue = {
    "none": 2,
    "xs": 5,
    "sm": 10,
    "md": 20,
    "lg": 33,
    "xl": 44,
    "2xl": 55,
    "3xl": 66,
    "full": 999,
  };
}

enum GSRadiis {
  none,
  $xs,
  $sm,
  $md,
  $lg,
  $xl,
  $2xl,
  $3xl,
  full,
}
