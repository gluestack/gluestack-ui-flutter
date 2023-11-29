import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/radio/radio_label.dart';
import 'package:gluestack_ui/src/theme/config/text/text.dart';

const GSStyleConfig gsRadioTextConfig = GSStyleConfig(
  componentName: 'RadioLabel',
  ancestorStyle: ['_text'],
);

final GSStyle radioLabelStyle = GSStyle.fromMap(data: textData)
    .merge(GSStyle.fromMap(data: radioLabelData));

class GSRadioTextStyle {
  static Map<GSSizes, GSStyle?> size = {
    GSSizes.$lg: radioLabelStyle.variants?.size?.$lg,
    GSSizes.$md: radioLabelStyle.variants?.size?.$md,
    GSSizes.$sm: radioLabelStyle.variants?.size?.$sm,
  };
}
