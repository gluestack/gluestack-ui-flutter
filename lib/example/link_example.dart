import 'package:flutter/material.dart';

import 'package:gluestack_flutter_pro/widgets/gs_link/gs_link.dart';
import 'package:gluestack_flutter_pro/widgets/gs_link/gs_link_text.dart';


class LinkExample extends StatelessWidget {
  const LinkExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSLink(url: 'https://gluestack.io/', text: GSLinkText(text:'click me')), 
          ],
        ),
      ),
    );
  }
}
