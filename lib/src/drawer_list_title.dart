import 'package:drawer_transition/src/drawer_item.dart';
import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final DrawerItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? selectedColor;
  final Color? selectedTileColor;
  final EdgeInsetsGeometry? contentPadding;
  final ShapeBorder? shape;
  final Color? hoverColor;

  const DrawerListTile({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
    this.selectedColor,
    this.selectedTileColor,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    this.shape,
    this.hoverColor,
  });

  @override
  Widget build(BuildContext context) {
    if (item.builder != null) {
      return InkWell(
        onTap: onTap,
        child: item.builder!(context, isSelected),
      );
    }

    return ListTile(
      onTap: onTap,
      selected: isSelected,
      selectedColor: selectedColor ?? Theme.of(context).primaryColor,
      selectedTileColor:
          selectedTileColor ?? Theme.of(context).primaryColor.withOpacity(0.2),
      leading: item.leading ?? (item.icon != null ? Icon(item.icon) : null),
      title:
          item.titleWidget ?? (item.title != null ? Text(item.title!) : null),
      trailing: item.trailing,
      hoverColor: hoverColor ?? Colors.white.withOpacity(0.1),
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
      contentPadding: contentPadding,
    );
  }
}
