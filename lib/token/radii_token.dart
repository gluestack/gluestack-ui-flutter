enum GSBorderRadius {$none, $xs, $sm, $md, $lg, $xl, $2xl, $3xl, $full}

class $GSRadii {
  const $GSRadii._();

  static const double none = 0.0;
  static const double $xs = 2.0;
  static const double $sm = 4.0;
  static const double $md = 6.0;
  static const double $lg = 8.0;
  static const double $xl = 12.0;
  static const double $2xl = 16.0;
  static const double $3xl = 24.0;
  static const double full = 9999.0;

  static const Map<String, double> radiiMap = {
    "none": $GSRadii.none,
    "xs": $GSRadii.$xs,
    "sm": $GSRadii.$sm,
    "md": $GSRadii.$md,
    "lg": $GSRadii.$lg,
    "xl": $GSRadii.$xl,
    "2xl": $GSRadii.$2xl,
    "3xl": $GSRadii.$3xl,
    "full": $GSRadii.full,
  };
}
