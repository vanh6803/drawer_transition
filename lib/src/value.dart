/// Drawer state value.
class DrawerTransitionValue {
  const DrawerTransitionValue({
    this.visible = false,
  });

  /// Indicates whether drawer visible or not.
  final bool visible;

  /// Create a value with hidden state.
  factory DrawerTransitionValue.hidden() {
    return const DrawerTransitionValue();
  }

  /// Create a value with visible state.
  factory DrawerTransitionValue.visible() {
    return const DrawerTransitionValue(
      visible: true,
    );
  }
}
