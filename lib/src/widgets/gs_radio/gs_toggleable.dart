import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

@optionalTypeArgs
mixin ToggleableStateMixin<S extends StatefulWidget> on TickerProviderStateMixin<S> {

  bool get isInteractive => onChanged != null;

  ValueChanged<bool?>? get onChanged;

  bool? get value;

  bool get tristate;

  Offset? get downPosition => _downPosition;
  Offset? _downPosition;

  void _handleTapDown(TapDownDetails details) {
    if (isInteractive) {
      setState(() {
        _downPosition = details.localPosition;
      });
    }
  }

  void _handleTap([Intent? _]) {
    if (!isInteractive) {
      return;
    }
    switch (value) {
      case false:
        onChanged!(true);
      case true:
        onChanged!(tristate ? null : false);
      case null:
        onChanged!(false);
    }
    context.findRenderObject()!.sendSemanticsEvent(const TapSemanticEvent());
  }

  void _handleTapEnd([TapUpDetails? _]) {
    if (_downPosition != null) {
      setState(() { _downPosition = null; });
    }
  }

  bool _focused = false;
  void _handleFocusHighlightChanged(bool focused) {
    if (focused != _focused) {
      setState(() { _focused = focused; });
    }
  }

  late final Map<Type, Action<Intent>> _actionMap = <Type, Action<Intent>>{
    ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: _handleTap),
  };

  Widget buildToggleable({
    FocusNode? focusNode,
    ValueChanged<bool>? onFocusChange,
    bool autofocus = false,
    required Size size,
    required CustomPainter painter,
  }) {
    return FocusableActionDetector(
      focusNode: focusNode,
      autofocus: autofocus,
      onFocusChange: onFocusChange,
      enabled: isInteractive,
      actions: _actionMap,
      onShowFocusHighlight: _handleFocusHighlightChanged,
      child: GestureDetector(
        excludeFromSemantics: !isInteractive,
        onTapDown: isInteractive ? _handleTapDown : null,
        onTap: isInteractive ? _handleTap : null,
        onTapUp: isInteractive ? _handleTapEnd : null,
        onTapCancel: isInteractive ? _handleTapEnd : null,
        child: Semantics(
          enabled: isInteractive,
          child: CustomPaint(
            size: size,
            painter: painter,
          ),
        ),
      ),
    );
  }
}

abstract class ToggleablePainter extends ChangeNotifier implements CustomPainter {

  Color get activeColor => _activeColor!;
  Color? _activeColor;
  set activeColor(Color value) {
    if (_activeColor == value) {
      return;
    }
    _activeColor = value;
    notifyListeners();
  }

  Color get inactiveColor => _inactiveColor!;
  Color? _inactiveColor;
  set inactiveColor(Color value) {
    if (_inactiveColor == value) {
      return;
    }
    _inactiveColor = value;
    notifyListeners();
  }

  Color get focusColor => _focusColor!;
  Color? _focusColor;
  set focusColor(Color value) {
    if (value == _focusColor) {
      return;
    }
    _focusColor = value;
    notifyListeners();
  }

  Offset? get downPosition => _downPosition;
  Offset? _downPosition;
  set downPosition(Offset? value) {
    if (value == _downPosition) {
      return;
    }
    _downPosition = value;
    notifyListeners();
  }

  bool get isFocused => _isFocused!;
  bool? _isFocused;
  set isFocused(bool? value) {
    if (value == _isFocused) {
      return;
    }
    _isFocused = value;
    notifyListeners();
  }

  bool get isActive => _isActive!;
  bool? _isActive;
  set isActive(bool? value) {
    if (value == _isActive) {
      return;
    }
    _isActive = value;
    notifyListeners();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool? hitTest(Offset position) => null;

  @override
  SemanticsBuilderCallback? get semanticsBuilder => null;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;

  @override
  String toString() => describeIdentity(this);
}