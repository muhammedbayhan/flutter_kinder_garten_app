import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:kindergartenapp/feature/parent/chat/view/parent_chat_view.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/feature/parent/drawer/drawerView.dart';
import 'package:kindergartenapp/feature/parent/gallery/view/gallery_view.dart';
import 'package:kindergartenapp/feature/parent/home/view/home_view.dart';
import 'package:kindergartenapp/feature/parent/foodList/view/food_list_view.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/main_appbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BaseScaffoldView extends StatefulWidget {
  const BaseScaffoldView({super.key});

  @override
  State<BaseScaffoldView> createState() => _BaseScaffoldViewState();
}

class _BaseScaffoldViewState extends State<BaseScaffoldView> {
  List<Widget> _buildScreens() {
    return [
      HomeView(),
      const GalleryView(),
      const ParentChatView(),
      const FoodListView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_filled),
          activeColorPrimary: ColorsP.primary,
          inactiveColorPrimary: ColorsP.systemIconColor,
          activeColorSecondary: ColorsP.white),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.grid_view_outlined),
          activeColorPrimary: ColorsP.primary,
          inactiveColorPrimary: ColorsP.systemIconColor,
          activeColorSecondary: ColorsP.white),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.chat_outlined),
          activeColorPrimary: ColorsP.primary,
          inactiveColorPrimary: ColorsP.systemIconColor,
          activeColorSecondary: ColorsP.white),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.list),
          activeColorPrimary: ColorsP.primary,
          inactiveColorPrimary: ColorsP.systemIconColor,
          activeColorSecondary: ColorsP.white),
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
      menuScreen: DrawerView(),
      mainScreen: Scaffold(
        appBar: MainAppBar(),
        body: PersistentTabView(
          context,

          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: ColorsP.scaffoldColor,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
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
