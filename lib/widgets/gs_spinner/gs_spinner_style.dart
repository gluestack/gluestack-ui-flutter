import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/spinner/spinner.dart';

GSStyleConfig gsSpinnerConfig = GSStyleConfig(
  componentName: 'Spinner',
);
GSStyle spinnerStyle = GSStyle.fromMap(data: spinnerData);

enum GSSpinnerSize { small, large }
