import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/KitchenSink/components/sidebar/ammenities.dart';
import 'package:gluestack_ui_example/example/KitchenSink/components/sidebar/booking_options.dart';
import 'package:gluestack_ui_example/example/KitchenSink/components/sidebar/customer_rating.dart';
import 'package:gluestack_ui_example/example/KitchenSink/components/sidebar/sortby.dart';
import 'package:gluestack_ui_example/example/KitchenSink/components/sidebar/types_of_places.dart';

class KSSideBar extends StatelessWidget {
  const KSSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GSVStack(
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const KSSortBy(),
        KSTypesOfPlaces(),
        const KSAmmenities(),
        const KSBookingOptions(),
        KSCustomerRating(),
      ],
    );
  }
}
