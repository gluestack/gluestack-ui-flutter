import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class CustomGSLayout extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  final GSStyle? style;
  final String title;
  final bool? hideBackButton;
  const CustomGSLayout(
      {super.key,
      required this.body,
      this.style,
      required this.title,
      this.floatingActionButton,
      this.hideBackButton});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GSLayout(
          floatingActionButton: floatingActionButton,
          body: GSVStack(
            children: [
              GSHeader(
                centerChild: true,
                style: GSStyle(bg: Colors.transparent),
                child: GSText(
                  text: title,
                  style: GSStyle(textStyle: const TextStyle(fontSize: 24)),
                ),
                // hideBackButton: hideBackButton ?? false,
              ),
              Expanded(child: body),
            ],
          )),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool hideBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.hideBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return GSBox(
      style: GSStyle(
        height: 56.0,
        dark: GSStyle(bg: $GSColors.trueGray800),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
      child: GSHStack(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          !hideBackButton
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: GSTheme.of(context).themeId == 'dark_theme'
                      ? $GSColors.white
                      : null,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              : const SizedBox(),
          Expanded(
            child: Center(
              child: GSText(
                text: title,
                size: GSSizes.$xl,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}
