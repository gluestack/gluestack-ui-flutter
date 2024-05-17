import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsAccordianContentTextConfig = GSStyleConfig(
    componentName: 'AccordianContent', ancestorStyle: ['_contentText']);

GSConfigStyle gsAccordianContentTextStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().accordionContentText);
