import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:kitchensink_gluestack/components/bottom_bar_tiles.dart';
import 'components/banner.dart';
import 'components/header.dart';
import 'components/main_component.dart';
import 'components/sidebar/sidebar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Currently selected theme mode
  ThemeMode _selectedThemeMode = ThemeMode.light;

  void toggleThemeMode() {
    setState(() {
      _selectedThemeMode = switch (_selectedThemeMode) {
        ThemeMode.light => ThemeMode.dark,
        ThemeMode.dark || ThemeMode.system => ThemeMode.light,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return GluestackProvider(
      gluestackTokenConfig: GluestackTokenConfig(
        gsColorsToken: const GSColorsToken(
          textLight700: Color(0xFF8C8C8C),
          info700: Colors.white,
          info600: Colors.white,
          info400: Colors.white,
          primary600: Color(0xffE11D48),
          primary300: Color(0xffE11D48),
          primary400: Color(0xffE11D48),
          primary700: Color(0xffE11D48),
          success500: Color(0xffE11D48),
          backgroundLight800: Color(0xffE11D48),
          backgroundDark400: Color(0xffE11D48),
        ),
      ),
      child: MaterialApp(
        themeMode: _selectedThemeMode,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.white,
          useMaterial3: false,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          colorSchemeSeed: Colors.black,
          useMaterial3: false,
          brightness: Brightness.dark,
        ),
        home: KitchenSink(toggleTheme: toggleThemeMode),
      ),
    );
  }
}

class KitchenSink extends StatelessWidget {
  final VoidCallback toggleTheme;

  const KitchenSink({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GSBox(
        style: GSStyle(
          md: GSStyle(isVisible: false),
          height: 85,
        ),
        child: BottomAppBar(
          child: GSBox(
            style: GSStyle(
              padding: EdgeInsets.only(
                  left: getRespValue(
                        buildContext: context,
                        xsValue: 12,
                        smValue: 24,
                      ) ??
                      4,
                  right: getRespValue(
                        buildContext: context,
                        xsValue: 12,
                        smValue: 24,
                      ) ??
                      4,
                  top: 21,
                  bottom: 18),
            ),
            child: const GSHStack(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BottomBarTile(
                  icon: Icons.home_outlined,
                  title: 'Home',
                ),
                BottomBarTile(
                  icon: Icons.filter_list_outlined,
                  title: 'Filter',
                ),
                BottomBarTile(
                  icon: Icons.add,
                  title: 'Listing',
                ),
                BottomBarTile(
                  icon: Icons.chat_bubble_outline_rounded,
                  title: 'Inbox',
                ),
                BottomBarTile(
                  icon: Icons.person_outline_rounded,
                  title: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: GSBox(
        style: GSStyle(md: GSStyle(isVisible: false)),
        child: Theme(
          data: ThemeData(useMaterial3: false),
          child: FloatingActionButton(
            onPressed: toggleTheme,
            backgroundColor: const Color(0xffE11D48),
            child: Transform.rotate(
                angle: -7,
                child: Icon(
                  Theme.of(context).brightness == Brightness.light
                      ? Icons.nightlight_rounded
                      : Icons.light_mode,
                  color: Colors.white,
                )),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GSBox(
              style: GSStyle(md: GSStyle(isVisible: false)),
              child: GSVStack(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const KSBanner(),
                  GSBox(
                    style: GSStyle(
                      padding: EdgeInsets.all(getRespValue(
                            buildContext: context,
                            xsValue: 6,
                            smValue: 16,
                          ) ??
                          0),
                    ),
                    child: GSInput(
                      suffixIcon: GSBox(
                        style: GSStyle(
                          padding: const EdgeInsets.all(5.5),
                        ),
                        child: ClipOval(
                          child: GSBox(
                            style: GSStyle(
                              color: const Color(0xffE11D48),
                            ),
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      variant: GSVariants.outline,
                      style: GSStyle(
                          borderRadius: 99,
                          onFocus: GSStyle(
                              borderColor: const Color(0xffE11D48),
                              borderWidth: 2)),
                      hintText: 'Anywhere • Any week • Add guests',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Colors.grey.shade600),
                    ),
                  ),
                  const Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: KSMainComponent(),
                    ),
                  ),
                ],
              ),
            ),
            // big screen widget
            GSBox(
              style: GSStyle(isVisible: false, md: GSStyle(isVisible: true)),
              child: GSVStack(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const KSBanner(),
                  KSHeader(
                    themeCallback: toggleTheme,
                  ),
                  Expanded(
                    child: GSBox(
                      style: GSStyle(
                        padding:
                            const EdgeInsets.only(top: 30, left: 21, right: 21),
                      ),
                      child: GSHStack(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GSBox(
                            style: GSStyle(
                              width: 200,
                            ),
                            child: GSBox(
                              style: GSStyle(
                                padding: const EdgeInsets.only(right: 30),
                              ),
                              child: const SingleChildScrollView(
                                child: KSSideBar(),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SingleChildScrollView(
                              child: KSMainComponent(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
