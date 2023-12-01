import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [themeAddon],
      directories: [
        WidgetbookCategory(
          name: 'Containers',
          children: [
            WidgetbookComponent(
              name: 'With colors',
              useCases: [
                WidgetbookUseCase(
                  name: 'green',
                  builder: (context) => Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'Texts',
          children: [
            WidgetbookComponent(
              name: 'Size',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Text(
                    'The default text ...',
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,

  // Add more theme properties as needed
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey,

  // Add more theme properties as needed
);
final themeAddon = ThemeAddon<ThemeData>(
  themes: [
    WidgetbookTheme(
      name: 'Light',
      data: lightTheme,
    ),
    WidgetbookTheme(
      name: 'Dark',
      data: darkTheme,
    ),
  ],
  initialTheme: WidgetbookTheme(
    name: 'Light',
    data: lightTheme,
  ),
  themeBuilder: (BuildContext context, ThemeData theme, Widget child) {
    return Theme(
      data: theme,
      child: child,
    );
  },
);

class AppThemeData {
  final Color color;

  AppThemeData({
    required this.color,
  });
}

class AppTheme extends InheritedWidget {
  const AppTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  final AppThemeData data;

  static AppThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    return widget!.data;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}

final blueTheme = AppThemeData(
  color: Colors.blue,
);

final yellowTheme = AppThemeData(
  color: Colors.yellow,
);
