import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class FabWithIconAndTextPreview extends StatelessWidget {
  const FabWithIconAndTextPreview({super.key});

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
                        height: 360,
                        width: 400,
                        borderRadius: $GSRadii.$md,
                        bg: $GSColors.trueGray800,
                        padding: const EdgeInsets.all(20)),
                    child: GSVStack(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const GSHeading(text: 'Benefits of Oranges'),
                        GSText(
                          text:
                              'Oranges are a great source of vitamin C, which is essential for a healthy immune system.',
                          style: GSStyle(
                              textStyle: TextStyle(
                            fontSize: 14,
                            color: $GSColors.warmGray400,
                          )),
                        ),
                        GSHStack(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GSBox(
                              style: GSStyle(
                                padding: const EdgeInsets.all(8.0),
                              ),
                              child: GSText(
                                text: "Wade Warrem",
                                style: GSStyle(
                                    textStyle: TextStyle(
                                  fontSize: 14,
                                  color: $GSColors.warmGray400,
                                )),
                              ),
                            ),
                            GSDivider(
                              orientation: GSOrientations.vertical,
                              style: GSStyle(
                                height: 20,
                                color: $GSColors.warmGray400,
                              ),
                            ),
                            GSBox(
                              style: GSStyle(
                                padding: const EdgeInsets.all(8.0),
                              ),
                              child: GSText(
                                text: "6th Oct, 2019",
                                style: GSStyle(
                                    textStyle: TextStyle(
                                  fontSize: 14,
                                  color: $GSColors.warmGray400,
                                )),
                              ),
                            ),
                            GSDivider(
                              orientation: GSOrientations.vertical,
                              style: GSStyle(
                                height: 20,
                                color: $GSColors.warmGray400,
                              ),
                            ),
                            GSBox(
                              style: GSStyle(
                                padding: const EdgeInsets.all(8.0),
                              ),
                              child: GSText(
                                text: "5 mins read",
                                style: GSStyle(
                                    textStyle: TextStyle(
                                  fontSize: 14,
                                  color: $GSColors.warmGray400,
                                )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: GSDivider(
                            orientation: GSOrientations.horizontal,
                            style: GSStyle(
                              height: 1,
                              color: $GSColors.warmGray400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const GSHeading(
                            text: 'How AI can benefit your business'),
                        GSText(
                          text:
                              'AI can automate tasks and processes, allowing for increasing efficiency and productivity.',
                          style: GSStyle(
                              textStyle: TextStyle(
                            fontSize: 14,
                            color: $GSColors.warmGray400,
                          )),
                        ),
                        GSHStack(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GSBox(
                              style: GSStyle(
                                padding: const EdgeInsets.all(8.0),
                              ),
                              child: GSText(
                                text: "Wade Warrem",
                                style: GSStyle(
                                    textStyle: TextStyle(
                                  fontSize: 14,
                                  color: $GSColors.warmGray400,
                                )),
                              ),
                            ),
                            GSDivider(
                              orientation: GSOrientations.vertical,
                              style: GSStyle(
                                height: 20,
                                color: $GSColors.warmGray400,
                              ),
                            ),
                            GSBox(
                              style: GSStyle(
                                padding: const EdgeInsets.all(8.0),
                              ),
                              child: GSText(
                                text: "6th Oct, 2019",
                                style: GSStyle(
                                    textStyle: TextStyle(
                                  fontSize: 14,
                                  color: $GSColors.warmGray400,
                                )),
                              ),
                            ),
                            GSDivider(
                              orientation: GSOrientations.vertical,
                              style: GSStyle(
                                height: 20,
                                color: $GSColors.warmGray400,
                              ),
                            ),
                            GSBox(
                              style: GSStyle(
                                padding: const EdgeInsets.all(8.0),
                              ),
                              child: GSText(
                                text: "5 mins read",
                                style: GSStyle(
                                    textStyle: TextStyle(
                                  fontSize: 14,
                                  color: $GSColors.warmGray400,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GSFab(
                    placement: GSFABPlacements.topRight,
                    onPressed: () {},
                    icon: GSFabIcon(
                      icon: Icons.search,
                      style: GSStyle(color: $GSColors.white),
                    ),
                    label: const GSFabLabel(text: 'Search'),
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
