import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_heading/gs_heading.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack.dart';
import 'package:gluestack_flutter_pro/widgets/gs_icon/gs_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_pressable/gs_pressable.dart';
import 'package:provider/provider.dart';


class ListYourPlaceModal1 extends StatelessWidget {
  const ListYourPlaceModal1({super.key});

  @override
  Widget build(BuildContext context) {
        final themeProvider = Provider.of<ThemeProvider>(context);
    return  AlertDialog(
                          backgroundColor:
                              themeProvider.getThemeData().canvasColor,
                          title: GSHStack(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const GSHeading(
                                  size: GSSizes.$sm, text: "List your place"),
                              GSPressable(
                                  onPress: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: GSIcon(icon: Icons.close))
                            ],
                          ),
                          content: GSHStack(
                            children: [
                              
                            ],
                          ),
                        );
  }
}