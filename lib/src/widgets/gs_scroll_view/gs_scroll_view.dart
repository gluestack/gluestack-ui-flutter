import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// A scrollable list of widgets arranged linearly. [GSScrollView] extends [BoxScrollView]
/// and allows for the creation of various types of list layouts, such as fixed or variable
/// item extents, or based on a prototype item's size.
class GSScrollView extends BoxScrollView {
  /// The fixed extent (height or width, depending on the scroll direction) of each item
  /// when using [SliverFixedExtentList]. If null, the list will default to using
  /// [SliverList], unless [itemExtentBuilder] or [prototypeItem] is provided.
  final double? itemExtent;

  /// A builder function that provides item extents dynamically for each child in the list
  /// when using [SliverVariedExtentList]. If null, the list will use either [itemExtent]
  /// or [prototypeItem], or default to [SliverList] if neither is provided.
  final ItemExtentBuilder? itemExtentBuilder;

  /// A prototype item whose size is used to estimate the size of other items in the list
  /// when using [SliverPrototypeExtentList]. This can be more efficient than specifying
  /// an [itemExtent] or using [itemExtentBuilder], especially for items with complex layouts.
  final Widget? prototypeItem;

  /// The delegate that provides the children for the sliver.
  final SliverChildDelegate childrenDelegate;

  GSScrollView({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    this.itemExtent,
    this.itemExtentBuilder,
    this.prototypeItem,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    super.cacheExtent,
    List<Widget> children = const <Widget>[],
    int? semanticChildCount,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
  })  : assert(
          (itemExtent == null && prototypeItem == null) ||
              (itemExtent == null && itemExtentBuilder == null) ||
              (prototypeItem == null && itemExtentBuilder == null),
          'You can only pass one of itemExtent, prototypeItem and itemExtentBuilder.',
        ),
        childrenDelegate = SliverChildListDelegate(
          children,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        ),
        super(
          semanticChildCount: semanticChildCount ?? children.length,
        );

  @override
  Widget buildChildLayout(BuildContext context) {
    // Constructs the appropriate sliver based on the provided item sizing strategy.
    if (itemExtent != null) {
      return SliverFixedExtentList(
        delegate: childrenDelegate,
        itemExtent: itemExtent!,
      );
    } else if (itemExtentBuilder != null) {
      return SliverVariedExtentList(
        delegate: childrenDelegate,
        itemExtentBuilder: itemExtentBuilder!,
      );
    } else if (prototypeItem != null) {
      return SliverPrototypeExtentList(
        delegate: childrenDelegate,
        prototypeItem: prototypeItem!,
      );
    }
    // Defaults to SliverList if no item sizing strategy is provided.
    return SliverList(delegate: childrenDelegate);
  }
}
