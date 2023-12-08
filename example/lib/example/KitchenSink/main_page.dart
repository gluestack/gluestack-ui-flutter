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
    bool isSmallScreen = isScreenSmallerThan(576, context);
    return Scaffold(
      bottomNavigationBar: isSmallScreen
          ? const BottomAppBar(
              child: Padding(
              padding: EdgeInsets.only(top: 4),
              child: Row(
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
            ))
          : null,
      floatingActionButton: isSmallScreen
          ? Theme(
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
            )
          : null,
      body: SafeArea(
        child: RespLayoutManager(
          smLayout: GSBox(
            style: GSStyle(
                // color: Colors.black,
                // md: GSStyle(color: Colors.green),
                // lg: GSStyle(color: Colors.pink),
                // xs: GSStyle(color: Colors.amber),
                ),
            child: GSVStack(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const KSBanner(),
                Padding(
                  padding: EdgeInsets.all(getRespValue(
                        buildContext: context,
                        xsValue: 6,
                        smValue: 16,
                      ) ??
                      0),
                  child: GSInput(
                    suffixIcon: const Padding(
                      padding: EdgeInsets.all(5.5),
                      child: ClipOval(
                        child: ColoredBox(
                          color: Colors.pink,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    variant: GSVariants.outline,
                    style: GSStyle(
                        borderRadius: 99,
                        onFocus:
                            GSStyle(borderColor: Colors.pink, borderWidth: 2)),
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
          mdLayout: GSVStack(
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
                  child: const GSHStack(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: SingleChildScrollView(
                            child: KSSideBar(),
                          ),
                        ),
                      ),
                      Flexible(
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
      ),
    );
  }
}
