import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';
import '../layout/drop_down.dart';

class ProgressExample extends StatefulWidget {
  const ProgressExample({super.key});

  @override
  State<ProgressExample> createState() => _ProgressExampleState();
}

class _ProgressExampleState extends State<ProgressExample> {
  final List dropdownSizeOptions = [
    GSProgressSizes.$xs,
    GSProgressSizes.$sm,
    GSProgressSizes.$md,
    GSProgressSizes.$lg,
    GSProgressSizes.$xl,
    GSProgressSizes.$2xl,
  ];
  GSProgressSizes selectedSizeOption = GSProgressSizes.$md;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    var code = '''
          GSProgress(
              value: 0.4,
              size: GSProgressSizes.\$md,
           )
  ''';
    return CustomGSLayout(
      title: "Progress",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
      ),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSProgress(
            value: 0.4,
            size: selectedSizeOption,
            // style: GSStyle(
            //   borderRadius: 0,
            //   color: Color(0xffff0000),
            //   bg: Color.fromARGB(255, 0, 170, 0),
            // ),
          ),
          controls: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropDown(
                title: "size",
                dropdownOptions: dropdownSizeOptions,
                selectedOption: selectedSizeOption,
                onChanged: updateSizeSelectedOption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
