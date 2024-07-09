import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/drop_down.dart';

class ToolTipExample extends StatefulWidget {
  const ToolTipExample({super.key});

  @override
  State<ToolTipExample> createState() => _ToolTipExampleState();
}

class _ToolTipExampleState extends State<ToolTipExample> {
  final List dropdownPlacementOptions = [
    GSToolTipPlacements.topLeft,
    GSToolTipPlacements.top,
    GSToolTipPlacements.topRight,
    GSToolTipPlacements.leftTop,
    GSToolTipPlacements.left,
    GSToolTipPlacements.leftBottom,
    GSToolTipPlacements.bottomLeft,
    GSToolTipPlacements.bottom,
    GSToolTipPlacements.bottomRight,
    GSToolTipPlacements.rightTop,
    GSToolTipPlacements.right,
    GSToolTipPlacements.rightBottom
  ];
  GSToolTipPlacements selectedPlacementOption = GSToolTipPlacements.top;
  void updatePlacementSelectedOption(dynamic newOption) {
    setState(() {
      selectedPlacementOption = newOption;
    });
  }

  var code = '''
GSToolTip(

          
),
  ''';
  @override
  Widget build(BuildContext context) {
    return GSCenter(
      child: CustomGSLayout(
        title: "ToolTip",
        style: GSStyle(
          dark: GSStyle(bg: $GSColors.black),
        ),
        body: BaseLayout(
          code: code,
          component: GSToolTip(
            isTruncated: true,
            italic: true,
            highlight: true,
            strikeThrough: true,
            sub: true,
            bold: true,
            placement: selectedPlacementOption,
            child: GSButton(
              size: GSButtonSizes.$lg,
              onPressed: () {},
              child: const GSText(
                size: GSSizes.$2xl,
                text: 'Hover',
              ),
            ),
          ),
          controls: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropDown(
                title: "placement",
                dropdownOptions: dropdownPlacementOptions,
                selectedOption: selectedPlacementOption,
                onChanged: updatePlacementSelectedOption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
