import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/token/space_token.dart';

class BaseLayout extends StatelessWidget {
  final Widget component;
  final Widget controls;
  const BaseLayout(
      {super.key, required this.component, required this.controls});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kIsWeb ? 500 : (MediaQuery.of(context).size.height * 0.8),
      margin: const EdgeInsets.symmetric(horizontal: $GSSpace.$16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Flex(
        direction: kIsWeb ? Axis.horizontal : Axis.vertical,
        children: [
          Expanded(
            child: Center(child: component),
          ),
          kIsWeb
              ? const VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                )
              : const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
          Expanded(
            child: Center(child: controls),
          ),
        ],
      ),
    );
  }
}
