import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ToggleTheme extends _$ToggleTheme {
  @override
  GSThemeMode build() {
    // Default to light theme mode.
    return GSThemeMode.light;
  }

  void toggleThemeMode({GSThemeMode? forcedThemeMode}) {
    state = forcedThemeMode ??
        switch (state) {
          GSThemeMode.light => GSThemeMode.dark,
          _ => GSThemeMode.light,
        };
  }
}
