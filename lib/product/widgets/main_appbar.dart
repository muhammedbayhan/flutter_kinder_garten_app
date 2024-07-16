import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  MainAppBar({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
 
  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
          onPressed: (){
            if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            } else {
              ZoomDrawer.of(context)!.open();
            }
          },
          icon: const Icon(Icons.menu),
        ),
actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none))],
    );
  }
}
