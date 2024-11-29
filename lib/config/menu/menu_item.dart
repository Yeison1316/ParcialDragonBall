import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title, required this.link, required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(title: 'home', link: '/', icon: Icons.home),
  MenuItems(title: 'Character', link: '/character', icon: Icons.person),
  MenuItems(title: 'Planets', link: '/planets', icon: Icons.earbuds_battery),
  MenuItems(title: 'Config', link: '/config', icon: Icons.settings),
  MenuItems(title: 'Pokemon', link: '/pokemon', icon: Icons.woman_sharp),
];
