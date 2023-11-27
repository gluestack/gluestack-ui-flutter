import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:gluestack_flutter_pro/token/space_token.dart';

class BaseLayout extends StatelessWidget {
  final Widget component;
  final Widget? controls;
  final String? code;
  const BaseLayout(
      {super.key, required this.component, this.controls, this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height * 0.8),
      margin: const EdgeInsets.symmetric(horizontal: $GSSpace.$16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Flex(
              direction: kIsWeb ? Axis.horizontal : Axis.vertical,
              children: [
                Expanded(
                  child: Center(child: component),
                ),
                if (controls != null)
                  kIsWeb
                      ? const VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                        )
                      : const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                if (controls != null)
                  Expanded(
                    child: Center(child: controls),
                  ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Expanded(
            child: SyntaxView(
              code: code ?? "",
              syntax: Syntax.DART,
              syntaxTheme: SyntaxTheme.vscodeDark(),
              fontSize: 16.0,
              expanded: true,
            ),
          ),
        ],
      ),
    );
  }
}

 // HighlightView(
            //   code ?? "",
            //   language: 'dart',
            //   theme: vsTheme,
            //   padding: const EdgeInsets.all(12),
            //   textStyle: const TextStyle(
            //     fontFamily: 'My awesome monospace font',
            //     fontSize: 16,
            //   ),
            // ),


  