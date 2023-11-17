import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_icon_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_provider.dart';

// class GSCheckBoxIcon extends StatelessWidget {
//   const GSCheckBoxIcon({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final value = GSCheckBoxProvider.of(context);
//     print(VisualDensity.maximumDensity);
//     return Checkbox(
//       value: value?.value ?? false,
//       onChanged: value?.onChanged,
//     );
//   }
// }


class GSCheckBoxIcon extends StatelessWidget {
  const GSCheckBoxIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        // if (onChanged != null) {
        //   onChanged!(!value);
        // }
      },
      child: Container(
        width: 64, // Set your desired width
        height: 64, // Set your desired height
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.black, // Set your border color
          ),
          borderRadius: BorderRadius.circular(4), // Set your border radius
        ),
        child: Center(
          child: true
              ? Icon(
                  Icons.check,
                  size: 18,
                  color: Colors.green, // Set your check color
                )
              : null,
        ),
      ),
    );
  }
}