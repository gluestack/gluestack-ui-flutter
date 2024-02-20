import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';

class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''
          GSStack(
              alignment: Alignment.center,
              children: [
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.red,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
              ],
          )
  ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack"),
      ),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSStack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
