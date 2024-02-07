import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:kitchensink_gluestack/components/sidebar/ammenities.dart';
import 'package:kitchensink_gluestack/components/sidebar/booking_options.dart';
import 'package:kitchensink_gluestack/components/sidebar/customer_rating.dart';
import 'package:kitchensink_gluestack/components/sidebar/sortby.dart';
import 'package:kitchensink_gluestack/components/sidebar/types_of_places.dart';

class KSSideBar extends StatelessWidget {
  const KSSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GSVStack(
      space: GSVstackSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const KSSortBy(),
        KSTypesOfPlaces(),
        const KSAmmenities(),
        const KSBookingOptions(),
        KSCustomerRating(),
        GSBox(style: GSStyle(height: 10)),
      ],
    );
  }
}
