import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/spinner/spinner.dart';

GSStyleConfig gsSpinnerConfig = GSStyleConfig(
  componentName: 'Spinner',
);
GSStyle spinnerStyle = GSStyle.fromMap(data: spinnerData);

enum GSSpinnerSize { small, large }
