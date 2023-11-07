import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/badge/badge.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_style.dart';

class GSBadgeIcon extends StatelessWidget {
  final IconData iconData;

  const GSBadgeIcon({
    super.key,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    final value = GSBadgeProvider.of(context);
    final fontSize = GSBadgeTextStyle.textSize[value!.size];
    final iconColor = value.iconAndTextColor;

    return Icon(
      iconData,
      color: iconColor,
      size: fontSize,
    );
  }
}
