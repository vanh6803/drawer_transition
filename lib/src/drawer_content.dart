import 'package:drawer_transition/src/drawer_list_title.dart';
import 'package:flutter/material.dart';

import 'drawer_item.dart';

class DrawerContent extends StatelessWidget {
  final List<DrawerItem> items;
  final ValueNotifier<int> selectedIndex;
  final VoidCallback onDrawerClose;
  final Widget? header;
  final Widget? footer;
  final Color? selectedColor;
  final Color? selectedTileColor;
  final EdgeInsetsGeometry? contentPadding;
  final ShapeBorder? shape;
  final Color? textColor;
  final Color? iconColor;

  const DrawerContent({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onDrawerClose,
    this.header,
    this.footer,
    this.selectedColor,
    this.selectedTileColor,
    this.contentPadding,
    this.shape,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: ListTileTheme(
        textColor: textColor ?? theme.colorScheme.onSurface,
        iconColor: iconColor ?? theme.colorScheme.onSurface,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (header != null) header!,
            Expanded(
              child: ValueListenableBuilder<int>(
                valueListenable: selectedIndex,
                builder: (context, selected, _) {
                  return ListView.builder(
                    itemCount: items.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return DrawerListTile(
                        icon: item.icon,
                        title: item.title,
                        isSelected: selected == index,
                        selectedColor: selectedColor,
                        selectedTileColor: selectedTileColor,
                        contentPadding: contentPadding,
                        shape: shape,
                        onTap: () {
                          selectedIndex.value = index;
                          onDrawerClose();
                        },
                      );
                    },
                  );
                },
              ),
            ),
            if (footer != null) footer!,
          ],
        ),
      ),
    );
  }
}
