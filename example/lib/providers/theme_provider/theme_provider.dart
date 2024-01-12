import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ToggleTheme extends _$ToggleTheme {
  @override
  ThemeMode build() {
    // Default to light theme mode.
    return ThemeMode.light;
  }

  void toggleThemeMode({ThemeMode? forcedThemeMode}) {
    state = forcedThemeMode ??
        switch (state) {
          ThemeMode.light => ThemeMode.dark,
          _ => ThemeMode.light,
        };
  }
}
