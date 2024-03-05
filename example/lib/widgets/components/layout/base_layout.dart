import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class BaseLayout extends StatefulWidget {
  final Widget component;
  final Widget? controls;
  final String? code;

  const BaseLayout({
    super.key,
    required this.component,
    this.controls,
    this.code,
  });

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    final componentWrapper = Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: widget.component,
      ),
    );

    final controlsWrapper = Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
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
        if (widget.controls != null) ...[
          if (isLandscape)
            Expanded(
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: controlsWrapper,
                ),
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

    final finalLayout = Container(
      margin: EdgeInsets.symmetric(horizontal: $GSSpace.$16),
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
