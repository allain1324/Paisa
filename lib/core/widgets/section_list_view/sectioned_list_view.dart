import 'package:flutter/material.dart';

import 'package:paisa/core/widgets/section_list_view/index_path.dart';
import 'package:paisa/core/widgets/section_list_view/list_item.dart';
import 'package:paisa/core/widgets/section_list_view/list_item_type.dart';

/// Signature for a function that creates a widget for a given [IndexPath], in a
/// list.
///
/// Used by [SectionedListView].
typedef ItemWidgetBuilder = Widget Function(
  BuildContext context,
  IndexPath index,
);

/// Signature for a function that returns the  the number of items(rows)
/// in a given section
///
/// Used by [SectionedListView].
typedef SectionWidgetBuilder = Widget Function(
  BuildContext context,
  int section,
);

class SectionedListView extends StatefulWidget {
  ///The number of sections in the ListView.
  final int sectionsCount;

  ///Function which returns an Widget which defines the item at the specified IndexPath.
  ///
  ///[itemBuilder] provides the current section and index.
  final ItemWidgetBuilder itemBuilder;

  ///Function which returns an Widget which defines the section header for each group.
  final SectionWidgetBuilder groupHeaderBuilder;

  ///Function which returns the number of items(rows) in a specified section.
  final int Function(int section) countOfItemInSection;

  ///Function which returns an Widget which defines the separator at the specified IndexPath.
  ///
  /// Separators only appear between list items: separator 0 appears after item
  /// 0 and the last separator appears after the last item.
  ///
  ///[separatorBuilder] provides the current section and index.
  final ItemWidgetBuilder? separatorBuilder;

  ///Function which returns an Widget which defines the separator at the specified section.
  ///
  /// Separators only appear between sections: separator 0 appears after section
  /// 0 and the last separator appears after the last section.
  ///
  ///[sectionSeparatorBuilder] provides the current section.
  final SectionWidgetBuilder? sectionSeparatorBuilder;

  /// Whether to wrap each child in an [AutomaticKeepAlive].
  ///
  /// Typically, children in lazy list are wrapped in [AutomaticKeepAlive]
  /// widgets so that children can use [KeepAliveNotification]s to preserve
  /// their state when they would otherwise be garbage collected off-screen.
  ///
  /// This feature (and [addRepaintBoundaries]) must be disabled if the children
  /// are going to manually maintain their [KeepAlive] state. It may also be
  /// more efficient to disable this feature if it is known ahead of time that
  /// none of the children will ever try to keep themselves alive.
  ///
  /// Defaults to true.
  final bool addAutomaticKeepAlives;

  /// Whether to wrap each child in a [RepaintBoundary].
  ///
  /// Typically, children in a scrolling container are wrapped in repaint
  /// boundaries so that they do not need to be repainted as the list scrolls.
  /// If the children are easy to repaint (e.g., solid color blocks or a short
  /// snippet of text), it might be more efficient to not add a repaint boundary
  /// and simply repaint the children during scrolling.
  ///
  /// Defaults to true.
  final bool addRepaintBoundaries;

  /// Whether to wrap each child in an [IndexedSemantics].
  ///
  /// Typically, children in a scrolling container must be annotated with a
  /// semantic index in order to generate the correct accessibility
  /// announcements. This should only be set to false if the indexes have
  /// already been provided by an [IndexedChildSemantics] widget.
  ///
  /// Defaults to true.
  ///
  /// See also:
  ///
  ///  * [IndexedChildSemantics], for an explanation of how to manually
  ///    provide semantic indexes.
  final bool addSemanticIndexes;

  const SectionedListView({
    super.key,
    required this.itemBuilder,
    required this.sectionsCount,
    required this.groupHeaderBuilder,
    required this.countOfItemInSection,
    this.separatorBuilder,
    this.sectionSeparatorBuilder,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
  });

  @override
  State<SectionedListView> createState() => _SectionedListViewState();
}

class _SectionedListViewState extends State<SectionedListView> {
  late List<ListItem> _indexToIndexPathList;

  @override
  void initState() {
    _indexToIndexPathList = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calculateIndexPath();
    return SliverList.builder(
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      addSemanticIndexes: widget.addSemanticIndexes,
      itemCount: _indexToIndexPathList.length,
      itemBuilder: _itemBuilder,
    );
  }

  void _calculateIndexPath() {
    _indexToIndexPathList = [];
    ListItem listItem;
    for (int section = 0; section < widget.sectionsCount; section++) {
      //Add section
      listItem = ListItem(
        indexPath: IndexPath(section: section, index: 0),
        type: ListItemType.section,
      );
      _indexToIndexPathList.add(listItem);

      final int rows = widget.countOfItemInSection(section);
      for (int index = 0; index < rows; index++) {
        //Add item
        listItem = ListItem(
          indexPath: IndexPath(section: section, index: index),
          type: ListItemType.item,
        );
        _indexToIndexPathList.add(listItem);

        //Add separator
        if (widget.separatorBuilder != null) {
          listItem = ListItem(
            indexPath: IndexPath(section: section, index: index),
            type: ListItemType.itemSeparator,
          );
          _indexToIndexPathList.add(listItem);
        }
      }

      //Add section separator
      if (widget.sectionSeparatorBuilder != null) {
        listItem = ListItem(
          indexPath: IndexPath(section: section, index: 0),
          type: ListItemType.sectionSeparator,
        );
        _indexToIndexPathList.add(listItem);
      }
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final ListItem listItem = _indexToIndexPathList[index];
    final IndexPath indexPath = listItem.indexPath;
    if (listItem.type.isSection) {
      return widget.groupHeaderBuilder(context, indexPath.section);
    } else if (listItem.type.isSectionSeparator) {
      return widget.sectionSeparatorBuilder!(context, indexPath.section);
    } else if (listItem.type.isItemSeparator) {
      return widget.separatorBuilder!(context, indexPath);
    }
    return widget.itemBuilder(context, indexPath);
  }
}
