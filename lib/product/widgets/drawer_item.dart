import 'package:flutter/material.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.function});
  final String title;
  final IconData icon;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: ColorsP.white, fontWeight: FontWeight.bold),
        ),
        leading: Icon(
          icon,
          color: ColorsP.white,
        ),
      ),
    );
  }
}
