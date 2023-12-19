import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class DividerExample extends StatelessWidget {
  const DividerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const GSText(
          text: "Divider",
        ),
      ),
      body: GSCenter(
        child: GSVStack(
          children: [
            GSDivider(
              orientation: GSOrientations.vertical,
              style: GSStyle(bg: Colors.black, height: 30),
            ),
            GSDivider(
              style: GSStyle(
                bg: Colors.blue,
              ),
            ),
            GSDivider(
              orientation: GSOrientations.vertical,
              style: GSStyle(
                bg: Colors.red,
              ),
            ),
            GSDivider(
              style: GSStyle(
                bg: Colors.orange,
              ),
            ),
            GSBox(
              style: GSStyle(
                padding: const EdgeInsets.only(bottom: 2),
              ),
              child: const GSText(
                text: 'GS Divider',
              ),
            ),
            GSDivider(
              style: GSStyle(
                bg: Colors.purple,
              ),
            ),
            GSDivider(
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
