import 'package:drawer_transition/drawer_transition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _drawerController = DrawerTransitionController();
  final _selectedIndex = ValueNotifier<int>(0);

  final List<(DrawerItem, Widget)> _drawerConfig = [
    (
      DrawerItem.basic(
        icon: Icons.home,
        title: 'Home',
      ),
      const Center(child: Text('Home')),
    ),
    (
      DrawerItem.custom(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        titleWidget: const Text('Profile'),
        trailing: const Badge(child: Icon(Icons.notifications)),
      ),
      const Center(child: Text('Profile')),
    ),
    (
      DrawerItem.builder(
        builder: (context, isSelected) {
          return ListTile(
            selected: isSelected,
            selectedColor: Colors.black,
            selectedTileColor: Colors.black.withOpacity(0.4),
            leading: Icon(Icons.favorite),
            title: Text(
              'Favourites',
              maxLines: 1,
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
      ),
      const Center(child: Text('Favourites')),
    ),
  ];

  // Tách items và pages từ _drawerConfig
  List<DrawerItem> get _items => _drawerConfig.map((e) => e.$1).toList();
  List<Widget> get _pages => _drawerConfig.map((e) => e.$2).toList();
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
            tileMode: TileMode.mirror,
            colors: [
              Colors.pink.withOpacity(0.8),
              Colors.pinkAccent.withOpacity(0.2)
            ],
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
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: DrawerContent(
        items: _items,
        selectedIndex: _selectedIndex,
        onDrawerClose: _drawerController.hideDrawer,
        selectedColor: Colors.black,
        selectedTileColor: Colors.black.withOpacity(0.4),
        header: Container(
          width: 128.0,
          height: 128.0,
          margin: const EdgeInsets.only(top: 24.0, bottom: 64.0),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.black26,
            shape: BoxShape.circle,
          ),
          child: Image.asset('assets/test.jpg', fit: BoxFit.cover),
        ),
        footer: DefaultTextStyle(
          style: const TextStyle(fontSize: 12, color: Colors.white54),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child: const Text('Terms of Service | Privacy Policy'),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Drawer Animation Example'),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<DrawerTransitionValue>(
              valueListenable: _drawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: ValueListenableBuilder<int>(
          valueListenable: _selectedIndex,
          builder: (context, index, _) {
            return _pages[index];
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _drawerController.dispose();
    super.dispose();
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _drawerController.showDrawer();
  }
}
