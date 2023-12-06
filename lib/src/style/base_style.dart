import 'dart:collection';

///
/// Base Style class for all Gluestack UI widgets.
///
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
  T? onInvalid;
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
    this.onInvalid,
    this.onActive,
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
        'onActive': onActive,
        'onHover': onHover,
        'onDisabled': onDisabled,
        'onInvalid': onInvalid,
        'dark': dark,
      });
}
