import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_modal/gs_modal_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';

class GSModal extends StatefulWidget {
  final GSModalSizes size;
  final Widget child;
  final GSStyle? style;
  final GSModalContent content;
  final AlignmentGeometry? alignment;

  const GSModal(
      {super.key,
      required this.size,
      required this.child,
      this.style,
      required this.content,
      this.alignment});

  @override
  State<GSModal> createState() => _GSModalState();
}

class _GSModalState extends State<GSModal> {
  @override
  Widget build(BuildContext context) {
    return GsGestureDetector(
      onPressed: () {
        showCustomModal(context, size: widget.size, content: widget.content);
      },
      child: widget.child,
    );
  }
}

void showCustomModal(
  BuildContext context, {
  GSStyle? style,
  GSModalSizes? size,
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

        return GSAncestor(
          decedentStyles: styler.descendantStyles,
          child: Positioned.fill(
            child: Stack(
              children: [
                GsGestureDetector(
                  onPressed: () {
                    overlayEntry.remove();
                  },
                  child: Container(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
                Align(
                  alignment: styler.alignment ?? Alignment.center,
                  child: SizedBox(
                      width: (styler.modal?.maxWidth ??
                          200 * (styler.modal?.width ?? 1)),
                      child: content),
                ),
              ],
            ),
          ),
        );
      }));
    },
  );

  overlayState.insert(overlayEntry);
}

void showModal(
  BuildContext context,
  GSStyle? style,
  GSModalSizes? size,
  GSModalContent content,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final modalSize = size?.toGSSize ?? modalStyle.props?.size;
      return GSStyleBuilder(
        child: Builder(builder: (context) {
          GSConfigStyle styler = resolveStyles(
            context: context,
            styles: [
              modalStyle,
              modalStyle.sizeMap(modalSize),
            ],
            inlineStyle: style,
          );

          return GSAncestor(
            decedentStyles: styler.descendantStyles,
            child: Dialog(child: content),
          );
        }),
      );
    },
  );
}
