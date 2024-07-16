import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsP.white,

      appBar: AppBar(
        backgroundColor: ColorsP.white,
        leading: IconButton(
          onPressed: (){
            if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            } else {
              ZoomDrawer.of(context)!.open();
            }
          },
          icon: const Icon(Icons.menu, color: ColorsP.white,),
        ),
        centerTitle: true,
        title: const Text('Main Screen',
          style: TextStyle(
            fontSize: 18.0,
            color: ColorsP.white,
          ),
        ),
      ),

      body: const Center(
        child: Text('Main Screen'),
      ),
    );
  }
}