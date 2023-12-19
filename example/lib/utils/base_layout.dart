import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class BaseLayout extends StatefulWidget {
  final Widget component;
  final Widget? controls;
  final String? code;
  const BaseLayout(
      {super.key, required this.component, this.controls, this.code});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    ScrollController scrollController = ScrollController();
    final componentWrapper = GSCenter(
      child: GSBox(
        style: GSStyle(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
        ),
        child: widget.component,
      ),
    );

    final controlsWrapper = GSCenter(
      child: GSBox(
        style: GSStyle(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
        ),
        child: widget.controls ?? const SizedBox.shrink(),
      ),
    );

    final topLayout = Flex(
      direction: isLandscape ? Axis.horizontal : Axis.vertical,
      children: [
        if (isLandscape)
          Expanded(child: SingleChildScrollView(child: componentWrapper))
        else
          SingleChildScrollView(child: componentWrapper),
        if (widget.controls != null)
          isLandscape
              ? GSDivider(
                  orientation: GSOrientations.vertical,
                  style: GSStyle(
                      // color: Colors.grey,
                      // width: 1,
                      ),
                )
              : const GSDivider(
                  orientation: GSOrientations.horizontal,
                ),
        if (widget.controls != null) ...[
          if (isLandscape)
            Expanded(
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                    controller: scrollController, child: controlsWrapper),
              ),
            )
          else
            controlsWrapper
        ]
      ],
    );

    final codeBlock = SyntaxView(
      code: widget.code ?? "",
      syntax: Syntax.DART,
      syntaxTheme: SyntaxTheme.vscodeDark(),
      fontSize: 16.0,
      expanded: isLandscape,
      withZoom: false,
    );

    final finalLayout = GSBox(
      style: GSStyle(
        margin: EdgeInsets.symmetric(horizontal: $GSSpace.$16),
        borderColor: Colors.grey,
        borderRadius: 10,
      ),
      child: GSVStack(
        children: [
          if (isLandscape) Expanded(child: topLayout) else topLayout,
          const SizedBox(height: 2),
          GSDivider(
            style: GSStyle(
                // color: Colors.grey,
                // width: 1,
                ),
          ),
          const SizedBox(height: 2),
          if (isLandscape) Expanded(child: codeBlock) else codeBlock,
        ],
      ),
    );

    if (!isLandscape) {
      return GSBox(
        style: GSStyle(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: SingleChildScrollView(child: finalLayout),
      );
    }

    return GSBox(
      style: GSStyle(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: finalLayout,
    );
  }
}
