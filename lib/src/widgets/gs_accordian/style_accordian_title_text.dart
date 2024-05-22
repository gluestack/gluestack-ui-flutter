import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsAccordionTitleTextConfig = GSStyleConfig(
    componentName: 'AccordianTitleText', ancestorStyle: ['_titleText']);

GSConfigStyle accordionTitleTextStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().accordionTitleText);
