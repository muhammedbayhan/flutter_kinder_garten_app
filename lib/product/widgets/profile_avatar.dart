import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.sizeDevice = 0.125,
    this.imgUrl = "assets/svg/maleStudentAvatar.svg",
  });
  final String imgUrl;
  final double sizeDevice;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorsP.transparent,
      radius: MediaQuery.of(context).size.width * sizeDevice,
      child: SvgPicture.asset(
        imgUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
