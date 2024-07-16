import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgPositioned extends StatelessWidget {
   const SvgPositioned({

    super.key, this.path="assets/svg/circle1.svg",this.top,this.bottom,this.left,this.right,this.imageheight
  });

final String path;
final double? top;
final double? bottom;
final double? left;
final double? right;
final double? imageheight;

  @override
  Widget build(BuildContext context) {
    return     Positioned(
    
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    
      child: SvgPicture.asset(
    
      path,
    
      height: imageheight,
    
      
    
    ),);
  }
}