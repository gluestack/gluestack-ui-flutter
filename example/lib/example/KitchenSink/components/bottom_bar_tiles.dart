import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class BottomBarTile extends StatelessWidget {
  final Function? onTap;
  final IconData icon;
  final String title;
  const BottomBarTile(
      {super.key, this.onTap, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!;
          }
        },
        child: GSVStack(
          children: [
            Icon(
              icon,
              color: Colors.pink
            ),
            GSBox(style: GSStyle(height: 2)),
            GSText(
              text: title,
              style: GSStyle(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                    fontSize: 12),
              ),
            ),
          ],
        ));
  }
}
