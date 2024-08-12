import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_modal/gs_modal_backdrop_style.dart';
import 'package:gluestack_ui/src/widgets/gs_modal/gs_modal_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';

class GSModal extends StatefulWidget {
  final GSModalSizes size;
  final Widget child;
  final GSStyle? style;
  final GSModalContent content;
  final AlignmentGeometry? alignment;
  final bool? barrierDismissible;

  const GSModal(
      {super.key,
      required this.size,
      required this.child,
      this.style,
      required this.content,
      this.barrierDismissible = true,
      this.alignment});

  @override
  State<GSModal> createState() => _GSModalState();
}

class _GSModalState extends State<GSModal> {
  @override
  Widget build(BuildContext context) {
    return GsGestureDetector(
      onPressed: () {
        showCustomModal(context,
            size: widget.size,
            content: widget.content,
            barrierDismissible: widget.barrierDismissible);
      },
      child: widget.child,
    );
  }
}

void showCustomModal(
  BuildContext context, {
  GSStyle? style,
  GSModalSizes? size,
  bool? barrierDismissible,
  required GSModalContent content,
}) {
  final overlayState = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) {
      final modalSize = size?.toGSSize ?? modalStyle.props?.size;
      return GSStyleBuilder(child: Builder(builder: (context) {
        GSConfigStyle styler = resolveStyles(
          context: context,
          styles: [
            modalStyle,
            modalStyle.sizeMap(modalSize),
          ],
          inlineStyle: style,
        );

        GSConfigStyle backdropStyler = resolveStyles(
          context: context,
          styles: [
            gsModalBackdropStyle,
          ],
          inlineStyle: style,
        );

        return GSAncestor(
          decedentStyles: styler.descendantStyles,
          child: Stack(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.basic,
                child: GestureDetector(
                  onTap: () {
                    if (barrierDismissible == true) {
                      overlayEntry
                          .remove(); // Remove the overlay when tapping outside the content
                    }
                  },
                  child: Container(
                    color:
                        backdropStyler.bg?.getColor(context).withOpacity(0.5) ??
                            const Color.fromRGBO(0, 0, 0, 0.5),
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
                          200 * (styler.modal?.width ?? 1)),
                      child: content),
                ),
              ),
            ],
          ),
        );
      }));
    },
  );

  overlayState.insert(overlayEntry);
}
