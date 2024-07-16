import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:kindergartenapp/feature/teacher/chat/view/teacher_chat_view.dart';
import 'package:kindergartenapp/feature/teacher/drawer/teacher_drawer_view.dart';
import 'package:kindergartenapp/feature/teacher/foodList/view/teacher_foodList_table_view.dart';
import 'package:kindergartenapp/feature/teacher/gallery/view/teacher_gallery_view.dart';
import 'package:kindergartenapp/feature/teacher/home/view/teacher_home_view.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/main_appbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class TeacherBaseScaffoldView extends StatefulWidget {
  const TeacherBaseScaffoldView({super.key});

  @override
  State<TeacherBaseScaffoldView> createState() => _TeacherBaseScaffoldView();
}

class _TeacherBaseScaffoldView extends State<TeacherBaseScaffoldView> {
  List<Widget> _buildScreens() {
    return [
       TeacherHomeView(),
      const TeacherGalleryView(),
      const TeacherChatView(),
      const TeacherFoodListTableView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_filled),
        activeColorPrimary: ColorsP.primary,
        inactiveColorPrimary: ColorsP.systemIconColor,
        activeColorSecondary: ColorsP.white
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.grid_view_outlined),
        activeColorPrimary: ColorsP.primary,
        inactiveColorPrimary: ColorsP.systemIconColor,
        activeColorSecondary: ColorsP.white
      ),
      PersistentBottomNavBarItem(
        icon:const Icon(Icons.chat_outlined),
        activeColorPrimary: ColorsP.primary,
        inactiveColorPrimary: ColorsP.systemIconColor,
        activeColorSecondary: ColorsP.white
      ),
      PersistentBottomNavBarItem(
        icon:const Icon(Icons.list),
        activeColorPrimary: ColorsP.primary,
        inactiveColorPrimary: ColorsP.systemIconColor,
        activeColorSecondary: ColorsP.white
      ),
    ];
  }
  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      showShadow: true,
     borderRadius: 24.0,
        style: DrawerStyle.defaultStyle,
      angle: 0.0,
      drawerShadowsBackgroundColor: ColorsP.white,
menuBackgroundColor: ColorsP.primary,

      menuScreen: TeacherDrawerView(),
      mainScreen: Scaffold(
        appBar: MainAppBar(),
        body: PersistentTabView(
          context,
      
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: ColorsP.scaffoldColor, 
          handleAndroidBackButtonPress: true, 
          resizeToAvoidBottomInset:
              true, 
          stateManagement: true, 
          hideNavigationBarWhenKeyboardShows:
              true, 
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(SizesP.itemRadius),
            colorBehindNavBar: ColorsP.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
       
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
       
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style7, //);
        ),
      ),
    );
  }
}
