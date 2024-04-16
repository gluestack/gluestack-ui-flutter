import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsAccordianConfig = GSStyleConfig(
    componentName: 'Accordian',
    descendantStyle: ['_titleText', '_contentText', '_icon'],
    ancestorStyle: ['_accordian']);

// GSStyle representing the base style for the Accordion
GSStyleInt accordionStyle = GSStyleInt.fromMap(
  data: getIt<GluestackCustomConfig>().accordion,
  descendantStyle: gsAccordianConfig.descendantStyle,
);
