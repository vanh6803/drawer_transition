# Drawer Transition

A Flutter package that provides a customizable drawer with smooth animations, gesture controls and scale transitions. This implementation is inspired by the android navigation drawer.

## Features

* 🎨 Fully customizable
* ✨ Smooth animations
* 📱 Gesture support
* 🔄 RTL support
* 🎯 Scale & slide transitions
* 🎭 Custom backdrop
* 🎮 Controller for programmatic control
* 🛡️ Safe area support

## Getting started

Add this to your package's `pubspec.yaml` file:

### From pub.dev

```yaml
dependencies:
  drawer_transition: ^0.0.1
```

### From Git repository

```yaml
dependencies:
  drawer_transition:
    git:
      url: git://github.com/username/drawer_transition.git
      ref: main
```

### From local path

```yaml
dependencies:
  drawer_transition:
    path: /path/to/drawer_transition
```

Then run:
```bash
flutter pub get
```

## Usage

### Basic Usage

```dart
final drawerController = DrawerTransitionController();

DrawerTransition(
  controller: drawerController,
  drawer: Container(
    // Your drawer content
  ),
  child: Scaffold(
    // Your main app content
  ),
);
```

### Complete Example

```dart
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _drawerController = DrawerTransitionController();

  @override
  Widget build(BuildContext context) {
    return DrawerTransition(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _drawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      openScale: 0.7,
      openRatio: 0.5,
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                _drawerController.hideDrawer();
                // Handle tap
              },
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            // More drawer items...
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: _drawerController.toggleDrawer,
            icon: ValueListenableBuilder<DrawerTransitionValue>(
              valueListenable: _drawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: YourContent(),
      ),
    );
  }

  @override
  void dispose() {
    _drawerController.dispose();
    super.dispose();
  }
}
```

## Properties

| Property | Type | Description |
|----------|------|-------------|
| `child` | Widget | The main content of your app |
| `drawer` | Widget | The drawer content that slides in |
| `controller` | DrawerTransitionController? | Optional controller to manage drawer state |
| `backdrop` | Widget? | Custom backdrop widget |
| `backdropColor` | Color? | Color of backdrop when drawer is open |
| `openRatio` | double | How much of the screen the drawer should occupy (0.0 to 1.0) |
| `openScale` | double | Scale factor for main content when drawer is open |
| `animationDuration` | Duration | Duration of the open/close animation |
| `animationCurve` | Curve? | Animation curve to use |
| `childDecoration` | BoxDecoration? | Decoration for the main content container |
| `animateChildDecoration` | bool | Whether to animate the child decoration |
| `rtlOpening` | bool | Whether drawer should open from right-to-left |
| `disabledGestures` | bool | Whether to disable gesture controls |

## Controller Methods

```dart
// Show drawer
drawerController.showDrawer();

// Hide drawer
drawerController.hideDrawer();

// Toggle drawer state
drawerController.toggleDrawer();
```

## Additional Examples

### Custom Backdrop

```dart
DrawerTransition(
  backdrop: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.purple],
      ),
    ),
  ),
  // ...
);
```

### RTL Support

```dart
DrawerTransition(
  rtlOpening: true,  // Drawer will open from right
  // ...
);
```

### Custom Animation

```dart
DrawerTransition(
  animationDuration: Duration(milliseconds: 500),
  animationCurve: Curves.bounceOut,
  // ...
);
```

## Notes

- Remember to dispose of the controller when it's no longer needed
- BoxShadow in childDecoration might cause animation jerks
- For optimal performance, wrap your drawer content with RepaintBoundary

## Issues and Feedback

Please file issues and feedback using the Github issue tracker: [issues](https://github.com/vanh6803/drawer_transition)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.