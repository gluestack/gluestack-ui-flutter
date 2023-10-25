import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio.dart';

enum GSRadioSize { sm, md, lg }

class GSRadioStyle {
  static GSStyle radioGSStyle = GSStyle.fromMap(data: radioData);
  static Map<GSRadioSize, GSStyle?> gsRadioStyle = {
    GSRadioSize.lg: radioGSStyle.variants?.size?.lg,
    GSRadioSize.md: radioGSStyle.variants?.size?.md,
    GSRadioSize.sm: radioGSStyle.variants?.size?.sm,
  };
}
