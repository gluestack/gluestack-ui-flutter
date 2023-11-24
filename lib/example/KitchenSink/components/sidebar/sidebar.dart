import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/sidebar/ammenities.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/sidebar/booking_options.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/sidebar/customer_rating.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/sidebar/sortby.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/sidebar/types_of_places.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

class KSSideBar extends StatelessWidget {
  const KSSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const GSVStack(
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KSSortBy(),
        KSTypesOfPlaces(),
        KSAmmenities(),
        KSBookingOptions(),
        KSCustomerRating(),
        
      ],
    );
  }
}
