import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/drop_down.dart';

class NavigationRailExample extends StatefulWidget {
  const NavigationRailExample({super.key});

  @override
  State<NavigationRailExample> createState() => _NavigationRailExampleState();
}

class _NavigationRailExampleState extends State<NavigationRailExample> {
  final List dropdownSizeOptions = [GSSizes.$sm, GSSizes.$md, GSSizes.$lg];
  GSSizes selectedSizeOption = GSSizes.$md;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  int _selectedIndex = 0;
  GSNavigationRailLabelType labelType = GSNavigationRailLabelType.all;
  double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    var code = '''

GSNavigationRail(
  selectedIndex: _selectedIndex,
  groupAlignment: groupAlignment,
  onDestinationSelected: (int index) {
    setState(() {
      _selectedIndex = index;
    });
  },
  labelType: labelType,
  destinations: const <GSNavigationRailDestination>[
    GSNavigationRailDestination(
      icon: Icon(Icons.favorite_border),
      selectedIcon: Icon(Icons.favorite),
      label: Text('First'),
    ),
    GSNavigationRailDestination(
      icon: Badge(child: Icon(Icons.bookmark_border)),
      selectedIcon: Badge(child: Icon(Icons.book)),
      label: Text('Second'),
    ),
    GSNavigationRailDestination(
      icon: Badge(
        label: Text('4'),
        child: Icon(Icons.star_border),
      ),
      selectedIcon: Badge(
        label: Text('4'),
        child: Icon(Icons.star),
      ),
      label: Text('Third'),
    ),
  ],
),

          
  ''';
    return CustomGSLayout(
      title: "GS Side Navigation",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
      ),
      body: BaseLayout(
        code: code,
        component: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 500,
                child: Row(
                  children: <Widget>[
                    GSNavigationRail(
                      size: selectedSizeOption,
                      indicatorWidth: 100,
                      minWidth: 200,
                      selectedIndex: _selectedIndex,
                      groupAlignment: groupAlignment,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      labelType: labelType,
                      destinations: const <GSNavigationRailDestination>[
                        GSNavigationRailDestination(
                          icon: Icon(Icons.favorite_border),
                          selectedIcon: Icon(Icons.favorite),
                          label: Text('Favourite'),
                        ),
                        GSNavigationRailDestination(
                          icon: Badge(child: Icon(Icons.bookmark_border)),
                          selectedIcon: Badge(child: Icon(Icons.book)),
                          label: Text('Bookmark'),
                        ),
                        GSNavigationRailDestination(
                          icon: Badge(
                            label: Text('4'),
                            child: Icon(Icons.star_border),
                          ),
                          selectedIcon: Badge(
                            label: Text('4'),
                            child: Icon(Icons.star),
                          ),
                          label: Text('Rating'),
                        ),
                      ],
                    ),
                    const VerticalDivider(thickness: 1, width: 1),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          const GSHeading(text: "SELECTED TAB"),
                          const SizedBox(height: 20),
                          _selectedIndex == 0
                              ? const GSText(
                                  text: 'Favourite Screen',
                                )
                              : _selectedIndex == 1
                                  ? const GSText(
                                      text: 'Bookmark Screen',
                                    )
                                  : const GSText(
                                      text: 'Rating Screen',
                                    ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        controls: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDown(
              title: "size",
              dropdownOptions: dropdownSizeOptions,
              selectedOption: selectedSizeOption,
              onChanged: updateSizeSelectedOption,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
