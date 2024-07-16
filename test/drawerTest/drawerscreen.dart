import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'mainscreen.dart';
import 'menuscreen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
        menuScreen: const MenuScreen(),
        mainScreen: const MainScreen(),
      showShadow: true,
      style: DrawerStyle.defaultStyle,
      angle: 0.0,
      isRtl: true,
    );
  }
}