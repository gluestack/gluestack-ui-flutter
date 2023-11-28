import 'dart:collection';

abstract class BaseStyle<T> {
  T? dark;
  T? md;
  T? lg;
  T? sm;
  T? xs;
  T? onHover;
  T? onFocus;
  T? onDisabled;
  T? input;
  T? icon;
  T? onInvaild;
  T? onActive;
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
    this.onDisabled,
    this.icon,
    this.input,
    this.onInvaild,
    this.onActive,
    this.web,
    this.android,
    this.ios,
  });
  T merge(T? overrideStyle);
  merge2(T? overrideStyle);
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
        'onHover': onHover,
        'onActive': onActive,
        'onDisabled': onDisabled,
        'onInvalid': onInvaild,
        'dark': dark,
      });
}
