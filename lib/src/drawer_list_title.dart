import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? selectedColor;
  final Color? selectedTileColor;
  final EdgeInsetsGeometry? contentPadding;
  final ShapeBorder? shape;
  final Color? hoverColor;

  const DrawerListTile({
    super.key,
    required this.icon,
    required this.title,
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
    return ListTile(
      onTap: onTap,
      selected: isSelected,
      selectedColor: selectedColor ?? Theme.of(context).primaryColor,
      selectedTileColor:
          selectedTileColor ?? Theme.of(context).primaryColor.withOpacity(0.2),
      leading: Icon(icon),
      title: Text(title),
      hoverColor: hoverColor ?? Colors.white.withOpacity(0.1),
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
      contentPadding: contentPadding,
    );
  }
}
