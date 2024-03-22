import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSSizes.$sm.name),
  Option<int>(value: 1, label: GSSizes.$md.name),
  Option<int>(value: 2, label: GSSizes.$lg.name),
];

class _NavigationRailStory extends StatefulWidget {
  const _NavigationRailStory();

  @override
  State<_NavigationRailStory> createState() => ___NavigationRailStoryState();
}

class ___NavigationRailStoryState extends State<_NavigationRailStory> {
  int _selectedIndex = 0;
  double groupAlignment = -1.0;
  GSNavigationRailLabelType labelType = GSNavigationRailLabelType.all;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Row(
        children: <Widget>[
          GSNavigationRail(
            size: GSSizes.values[context.knobs
                .options(label: 'Size', initial: 1, options: sizeOptions)],
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
    );
  }
}

final class NavigationRailStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => const _NavigationRailStory(),
    );
  }

  @override
  String get routePath => "navigation-rail-preview";

  @override
  String get storyName => "Navigation Rail";
}
