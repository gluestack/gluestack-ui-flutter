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
  T? active;
  T? web;
  T? android;
  T? ios;
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
    this.active,
    this.web,
    this.android,
    this.ios,
  });
  T merge(T? overrideStyle);
  T copy();
  LinkedHashMap<String, T?> get contextStyles => LinkedHashMap.from({
        'web': web,
        'ios': ios,
        'android': android,
        'xs': xs,
        'sm': sm,
        'md': md,
        'lg': lg,
        'onFocus': onFocus,
        'active': active,
        'onHover': onHover,
        'disabled': disabled,
        'invalid': invaild,
        'dark': dark,
      });
}
