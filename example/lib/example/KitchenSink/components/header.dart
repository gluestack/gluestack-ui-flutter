import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class KSHeader extends StatelessWidget {
  final Function themeCallback;
  final ThemeProvider themeProvider;
  const KSHeader(
      {super.key, required this.themeCallback, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return GSVStack(
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: GSHStack(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GSHStack(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GSIcon(
                      icon: Icons.home_filled,
                      size: GSSizes
                          .$xl, //Error: Should throw at least asetion for now if size not deinfed (3xl. 5xl) in the component
                      style: GSStyle(
                          color: const Color(0xffE11D48),
                          height: 30,
                          width:
                              30, //Comment: overrideing default size cuz I needed it to be big
                          icon: GSStyle(
                            height:
                                122, //Error: Does not Work, instead of taking size from style, it should take from icon style ? idk...
                            width: 122, //Error: Does not Work
                            color:
                                const Color(0xffE11D48), //Error: Does not Work
                          )),
                    ),
                    GSText(
                      text: "Homestay",
                      style: GSStyle(
                          fontWeight: FontWeight.bold, //Error: Does not Work
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xffE11D48),
                              fontSize: 24)),
                    ),
                  ],
                ),
                GSBox(
                  style: GSStyle(color: $GSColors.pink400.withOpacity(0.5)),
                  child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: GSText(text: '⚠ WIP')),
                ),
                GSHStack(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                      child: GSPressable(
                        hitSlop: 2,
                        style: GSStyle(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onHover: GSStyle(color: Colors.transparent)),
                        child: Transform.rotate(
                          angle: -0.7,
                          child: GSIcon(
                            size: GSSizes.$xl,
                            icon:
                                themeProvider.currentTheme == GSThemeMode.light
                                    ? Icons.nightlight_rounded
                                    : Icons.light_mode,
                            style: GSStyle(
                                color: $GSColors.backgroundLight700,
                                dark: GSStyle(
                                  color: $GSColors.backgroundDark300,
                                )),
                          ),
                        ),
                        onPress: () {
                          themeCallback();
                        },
                      ),
                    ),
                    GSAvatar(
                      size: GSSizes.$sm,
                      style: GSStyle(bg: $GSColors.backgroundLight600),
                      avatarBadge: GSAvatarBadge(
                        style: GSStyle(
                          bg: $GSColors
                              .primary500, // TODO: change primary colors so that it reflects here
                          dark:
                              GSStyle(borderColor: $GSColors.backgroundDark900),
                        ),
                      ),
                      avatarImage: const GSImage(
                        imageType: GSImageType.network,
                        path:
                            "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
                      ),
                      fallBackText: const GSAvatarFallBackText(
                        'Henry Stan',
                      ),
                    )
                  ],
                ),
              ]),
        ),
        const SizedBox(height: 15),
        GSDivider(
          orientation: GSOrientations.horizontal,
          style: GSStyle(color: $GSColors.textDark300, height: 1),
        )
      ],
    );
  }
}
