import 'package:flutter/material.dart';

import 'value.dart';

/// Drawer Controller that manage drawer state.
class DrawerTransitionController extends ValueNotifier<DrawerTransitionValue> {
  /// Creates controller with initial drawer state. (Hidden by default)
  DrawerTransitionController([DrawerTransitionValue? value])
      : super(value ?? DrawerTransitionValue.hidden());

  /// Shows drawer.
  void showDrawer() {
    value = DrawerTransitionValue.visible();
    notifyListeners();
  }

  /// Hides drawer.
  void hideDrawer() {
    value = DrawerTransitionValue.hidden();
    notifyListeners();
  }

  /// Toggles drawer.
  void toggleDrawer() {
    if (value.visible) {
      return hideDrawer();
    }

    return showDrawer();
  }
}
