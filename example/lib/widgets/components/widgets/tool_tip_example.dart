import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/drop_down.dart';
import 'package:gluestack_ui_example/widgets/components/layout/toggle.dart';

class ToolTipExample extends StatefulWidget {
  const ToolTipExample({super.key});

  @override
  State<ToolTipExample> createState() => _ToolTipExampleState();
}

class _ToolTipExampleState extends State<ToolTipExample> {
  bool enableNotch = false;
  final List dropdownPlacementOptions = [
    GSTooltipPosition.top,
    GSTooltipPosition.left,
    GSTooltipPosition.right,
    GSTooltipPosition.bottom
  ];
  GSTooltipPosition selectedPlacementOption = GSTooltipPosition.top;
  void updatePlacementSelectedOption(dynamic newOption) {
    setState(() {
      selectedPlacementOption = newOption;
    });
  }

  void updateEnableNotch(bool value) {
    setState(() {
      enableNotch = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var code = '''
GSToolTip(
  content: "Tooltip",
  distance: 10,
  style: GSStyle(
    bg: \$GSColors.backgroundDark100
  ),
  placement: $selectedPlacementOption,
  child: const GSBadge(
     size: GSBadgeSizes.\$lg,
     text: GSBadgeText("Hover"),
  ),
),
    ''';
    return GSCenter(
      child: CustomGSLayout(
        title: "ToolTip",
        style: GSStyle(
          dark: GSStyle(bg: $GSColors.black),
        ),
        body: BaseLayout(
          code: code,
          component: Column(
            children: [
              GSToolTip(
                  enableNotch: enableNotch,
                  distance: 10,
                  placement: selectedPlacementOption,
                  style: GSStyle(bg: GSTheme.of(context).background100),
                  content: 'Tooltip',
                  child: const GSBadge(
                    size: GSBadgeSizes.$lg,
                    text: GSBadgeText("Hover Me"),
                  )),
            ],
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
              const SizedBox(height: 20),
              CustomToggle(
                title: "Enable Notch",
                value: enableNotch,
                onToggle: updateEnableNotch,
              )
            ],
          ),
        ),
      ),
    );
  }
}
