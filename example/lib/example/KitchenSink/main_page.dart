import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/KitchenSink/components/bottom_bar_tiles.dart';
import 'package:gluestack_ui_example/example/KitchenSink/responsive_base_widgets/resp_layout_manager.dart';
import 'package:gluestack_ui_example/example/KitchenSink/responsive_base_widgets/resp_value_gettter.dart';
import 'components/banner.dart';
import 'components/header.dart';
import 'components/main_component.dart';
import 'components/sidebar/sidebar.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';

class LayoutExample extends StatelessWidget {
  final VoidCallback toggleTheme;

  const LayoutExample({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    // bool isSmallScreen = isScreenSmallerThan(576, context);
    return Scaffold(
      bottomNavigationBar: GSBox(
        style: GSStyle(md: GSStyle(isVisible: false)),
        child: BottomAppBar(
            child: GSBox(
          style: GSStyle(
            padding: const EdgeInsets.only(top: 4),
          ),
          child: const Row(
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
        )),
      ),
      floatingActionButton: GSBox(
        style: GSStyle(md: GSStyle(isVisible: false)),
        child: Theme(
          data: ThemeData(useMaterial3: false),
          child: FloatingActionButton(
            onPressed: toggleTheme,
            backgroundColor: Colors.pink,
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
              style: GSStyle(isVisible: true, md: GSStyle(isVisible: false)),
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
                            style: GSStyle(color: $GSColors.red500),
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
                              borderColor: Colors.pink, borderWidth: 2)),
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
