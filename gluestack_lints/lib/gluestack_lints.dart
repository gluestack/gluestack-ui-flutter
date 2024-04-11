import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:gluestack_lints/src/amend_model_suffix.dart';
import 'package:gluestack_lints/src/replace_container_with_gsbox.dart';

PluginBase createPlugin() => _GluestackPlugin();

class _GluestackPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs _) => [
        AmendModelSuffix(),
        ReplaceContainerWithGSBox(),
      ];
}
