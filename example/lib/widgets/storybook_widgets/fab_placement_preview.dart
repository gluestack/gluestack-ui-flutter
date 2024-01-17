import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class FabPlacementPreview extends StatelessWidget {
  const FabPlacementPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Fab',
        stories: [
          Story(
            name: 'Fab',
            builder: (context) => GSCenter(
              child: Stack(
                children: [
                  GSBox(
                    style: GSStyle(
                        height: 300,
                        width: 450,
                        borderRadius: $GSRadii.$md,
                        bg: $GSColors.trueGray800,
                        padding: const EdgeInsets.all(20)),
                    child: GSVStack(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GSCheckBox(
                          icon: GSCheckBoxIndicator(
                            style: GSStyle(
                                margin: EdgeInsets.only(
                              right: $GSSpace.$4,
                              bottom: $GSSpace.$4,
                            )),
                            child: const GSCheckBoxIcon(),
                          ),
                          value: "Design",
                          onChanged: (value) {},
                          label: const GSVStack(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GSCheckBoxLabel(text: "Design"),
                              GSText(
                                  text:
                                      'Subscribe to updates from the Design Feed')
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GSCheckBox(
                          icon: GSCheckBoxIndicator(
                            style: GSStyle(
                                margin: EdgeInsets.only(
                              right: $GSSpace.$4,
                              bottom: $GSSpace.$4,
                            )),
                            child: const GSCheckBoxIcon(),
                          ),
                          value: "Marketing",
                          onChanged: (value) {},
                          label: const GSVStack(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GSCheckBoxLabel(text: "Marketing"),
                              GSText(
                                  text:
                                      'Subscribe to updates from the Marketing Feed')
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GSCheckBox(
                          icon: GSCheckBoxIndicator(
                            style: GSStyle(
                                margin: EdgeInsets.only(
                              right: $GSSpace.$4,
                              bottom: $GSSpace.$4,
                            )),
                            child: const GSCheckBoxIcon(),
                          ),
                          value: "Engineering",
                          onChanged: (value) {},
                          label: const GSVStack(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GSCheckBoxLabel(text: "Engineering"),
                              GSText(
                                  text:
                                      'Subscribe to updates from the Engineering Feed')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GSFab(
                    placement: GSPlacements.bottomCenter,
                    onPressed: () {},
                    icon: GSFabIcon(
                      icon: Icons.add,
                      style: GSStyle(color: $GSColors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
