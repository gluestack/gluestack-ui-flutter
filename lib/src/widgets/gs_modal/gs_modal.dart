import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_modal/gs_modal_backdrop_style.dart';
import 'package:gluestack_ui/src/widgets/gs_modal/gs_modal_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_modal/gs_modal_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';

class GSModal extends StatefulWidget {
  final GSModalSizes size;
  final Widget child;
  final GSStyle? style;
  final GSModalContent content;
  final AlignmentGeometry? alignment;
  final bool barrierDismissible;
  final bool isOpen;
  final Function()? onClose;
  final bool showBackdrop;

  const GSModal({
    super.key,
    required this.size,
    required this.child,
    this.style,
    required this.content,
    this.barrierDismissible = true,
    this.alignment,
    this.onClose,
    this.isOpen = false,
    this.showBackdrop = true,
  });

  @override
  State<GSModal> createState() => _GSModalState();
}

class _GSModalState extends State<GSModal> {
  OverlayEntry? _overlayEntry;
  late bool _isOpen;

  @override
  void initState() {
    super.initState();
    _isOpen = widget.isOpen;
    if (_isOpen) {
      _showModal();
    }
  }

  @override
  void didUpdateWidget(GSModal oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isOpen && !_isOpen) {
      _showModal();
    } else if (!widget.isOpen && _isOpen) {
      _removeModal();
    }
  }

  void _showModal() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isOpen = true;
    });
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        final modalSize = widget.size.toGSSize ?? modalStyle.props?.size;

        return GSStyleBuilder(
          child: Builder(
            builder: (context) {
              GSConfigStyle styler = resolveStyles(
                context: context,
                styles: [
                  modalStyle,
                  modalStyle.sizeMap(modalSize),
                ],
                inlineStyle: widget.style,
              );

              GSConfigStyle backdropStyler = resolveStyles(
                context: context,
                styles: [
                  gsModalBackdropStyle,
                ],
                inlineStyle: widget.style,
              );

              return GSModalProvider(
                removeModal: _removeModal,
                child: GSAncestor(
                  decedentStyles: styler.descendantStyles,
                  child: Stack(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.basic,
                        child: GestureDetector(
                          onTap: () {
                            if (widget.barrierDismissible == true) {
                              _removeModal();
                            }
                          },
                          child: Container(
                            color: widget.showBackdrop
                                ? backdropStyler.bg
                                        ?.getColor(context)
                                        .withOpacity(0.5) ??
                                    const Color.fromRGBO(0, 0, 0, 0.5)
                                : const Color.fromRGBO(0, 0, 0, 0),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Do nothing to prevent the modal from closing when tapped
                        },
                        child: Align(
                          alignment: styler.alignment ?? Alignment.center,
                          child: SizedBox(
                            width: (styler.modal?.maxWidth ??
                                1 * (styler.modal?.width ?? 1)),
                            height: styler.modal?.height,
                            child: widget.content,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  _removeModal() {
    // Guard clause to prevent double execution
    if (!_isOpen || _overlayEntry == null) {
      return; // Exit if modal is already closed or there's no overlay to remove
    }
    // Remove the overlay entry
    _overlayEntry!.remove();
    _overlayEntry = null;

    // Update the state to closed
    _isOpen = false;

    // Defer the onClose callback to avoid conflicts with the current build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.onClose != null) {
        widget.onClose!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GsGestureDetector(
      onPressed: () {
        _isOpen ? _removeModal() : _showModal();
      },
      child: widget.child,
    );
  }
}
