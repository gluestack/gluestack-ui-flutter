import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/sidebar/booking_options.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/sidebar/sortby.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

class KSSideBar extends StatelessWidget {
  const KSSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GSVStack(
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KSSortBy(),
        KSBookingOptions(),
      ],
    );
  }
}
