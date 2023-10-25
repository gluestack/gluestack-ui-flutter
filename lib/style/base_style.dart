import 'dart:collection';

abstract class BaseStyle<T> {
  T? dark;
  T? md;
  T? lg;
  T? sm;
  T? xs;
  T? onHover;
  T? onFocus;
  T? disabled;
  T? input;
  T? icon;
  T? invaild;
  BaseStyle({
    this.dark,
    this.md,
    this.sm,
    this.lg,
    this.xs,
    this.onHover,
    this.onFocus,
    this.disabled,
    this.icon,
    this.input,
    this.invaild,
  });
  T merge(T? overrideStyle);
  T copy();
  LinkedHashMap<String, T?> get contextStyles => LinkedHashMap.from({
        'xs': xs,
        'sm': sm,
        'md': md,
        'lg': lg,
        'dark': dark,
      });
}
