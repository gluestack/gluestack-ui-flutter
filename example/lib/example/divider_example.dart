import 'package:flutter/material.dart' hide Center,Divider;
import 'package:gluestack_ui/gluestack_ui.dart';

class DividerExample extends StatelessWidget {
  const DividerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Divider(
              orientation: GSOrientations.vertical,
              style: GSStyle(bg: Colors.black, height: 30),
            ),
            Divider(
              style: GSStyle(
                bg: Colors.blue,
              ),
            ),
            Divider(
              orientation: GSOrientations.vertical,
              style: GSStyle(
                bg: Colors.red,
              ),
            ),
            Divider(
              style: GSStyle(
                bg: Colors.orange,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Text('GS Divider'),
            ),
            Divider(
              style: GSStyle(
                bg: Colors.purple,
              ),
            ),
            Divider(
              orientation: GSOrientations.vertical,
              style: GSStyle(
                bg: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
