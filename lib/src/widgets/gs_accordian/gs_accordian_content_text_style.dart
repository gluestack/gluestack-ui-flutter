import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsAccordianContentTextConfig = GSStyleConfig(
    componentName: 'AccordianContent', ancestorStyle: ['_contentText']);

GSStyleInt gsAccordianContentTextStyle = GSStyleInt.fromMap(
    data: getIt<GluestackCustomConfig>().accordionContentText);
