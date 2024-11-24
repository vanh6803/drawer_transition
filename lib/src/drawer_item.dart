import 'package:flutter/material.dart';

class DrawerItem {
  /// The icon to display (optional if custom leading widget is provided)
  final IconData? icon;

  /// The title text (optional if custom title widget is provided)
  final String? title;

  /// Custom widget to display as the leading widget
  final Widget? leading;

  /// Custom widget to display as the title
  final Widget? titleWidget;

  /// Custom widget to display as the trailing widget
  final Widget? trailing;

  /// Custom builder for entire list tile
  final Widget Function(BuildContext context, bool isSelected)? builder;

  DrawerItem({
    this.icon,
    this.title,
    this.leading,
    this.titleWidget,
    this.trailing,
    this.builder,
  }) : assert(
          (icon != null && title != null) ||
              (leading != null && titleWidget != null) ||
              builder != null,
          'Must provide either icon/title pair, custom widgets, or a builder',
        );

  /// Create item with basic icon and title
  factory DrawerItem.basic({
    required IconData icon,
    required String title,
  }) {
    return DrawerItem(
      icon: icon,
      title: title,
    );
  }

  /// Create item with custom widgets
  factory DrawerItem.custom({
    required Widget leading,
    required Widget titleWidget,
    Widget? trailing,
  }) {
    return DrawerItem(
      leading: leading,
      titleWidget: titleWidget,
      trailing: trailing,
    );
  }

  /// Create item with custom builder
  factory DrawerItem.builder({
    required Widget Function(BuildContext context, bool isSelected) builder,
  }) {
    return DrawerItem(builder: builder);
  }
}
