import 'package:gluestack_ui/gluestack_ui.dart';

typedef ShowGSTooltip = Future<void> Function();
typedef HideGSTooltip = Future<void> Function();

class GSTooltipController extends ValueNotifier<GSTooltipStatus> {
  GSTooltipController()
      : _show = _defaultThrow,
        _hide = _defaultThrow,
        super(GSTooltipStatus.hidden);

  Future<void> show() async {
    await _show();
    value = GSTooltipStatus.showing;
    notifyListeners();
  }

  void notify(GSTooltipStatus status) {
    if (value != status) {
      value = status;
      notifyListeners();
    }
  }

  Future<void> hide() async {
    await _hide();
    value = GSTooltipStatus.hidden;
    notifyListeners();
  }

  late ShowGSTooltip _show;
  late HideGSTooltip _hide;

  static Future<void> _defaultThrow() {
    throw StateError('Attach the controller to an GS Tooltip Widget');
  }

  @mustCallSuper
  void attach({required ShowGSTooltip show, required HideGSTooltip hide}) {
    _show = show;
    _hide = hide;
  }
}
