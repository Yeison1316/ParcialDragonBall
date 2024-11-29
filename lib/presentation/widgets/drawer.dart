import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial/config/menu/menu_item.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int navMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navMenuIndex,
      onDestinationSelected: (value) {
        setState(() {
          navMenuIndex = value;
        });
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
      },
      children: [...appMenuItems.map((e) => NavigationDrawerDestination(
        icon: Icon(e.icon), 
        label: Text(e.title)
        )
        )]
      );
  }
}