import 'package:flutter/material.dart' hide Center;
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:gluestack_ui/gluestack_ui.dart' hide Divider;

class BaseLayout extends StatelessWidget {
  final Widget component;
  final Widget? controls;
  final String? code;
  const BaseLayout(
      {super.key, required this.component, this.controls, this.code});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    final componentWrapper = Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: component,
      ),
    );

    final controlsWrapper = Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: controls ?? const SizedBox.shrink(),
      ),
    );

    final topLayout = Flex(
      direction: isLandscape ? Axis.horizontal : Axis.vertical,
      children: [
        if (isLandscape)
          Expanded(child: componentWrapper)
        else
          componentWrapper,
        if (controls != null)
          isLandscape
              ? const VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                  width: 1,
                )
              : const Divider(
                  color: Colors.grey,
                  thickness: 1,
                  height: 1,
                ),
        if (controls != null) ...[
          if (isLandscape)
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(child: controlsWrapper),
              ),
            )
          else
            controlsWrapper
        ]
      ],
    );

    final codeBlock = SyntaxView(
      code: code ?? "",
      syntax: Syntax.DART,
      syntaxTheme: SyntaxTheme.vscodeDark(),
      fontSize: 16.0,
      expanded: isLandscape,
      withZoom: false,
    );

    final finalLayout = Container(
      margin: const EdgeInsets.symmetric(horizontal: $GSSpace.$16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          if (isLandscape) Expanded(child: topLayout) else topLayout,
          const SizedBox(height: 2),
          const Divider(
            color: Colors.grey,
            thickness: 1,
            height: 1,
          ),
          const SizedBox(height: 2),
          if (isLandscape) Expanded(child: codeBlock) else codeBlock,
        ],
      ),
    );

    if (!isLandscape) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: SingleChildScrollView(child: finalLayout),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: finalLayout,
    );
  }
}
