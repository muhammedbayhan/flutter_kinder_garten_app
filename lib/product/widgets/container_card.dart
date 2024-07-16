import 'package:flutter/material.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';

class ContainerCard extends StatelessWidget {
   const ContainerCard({
    super.key,required this.widget,this.width=0.75,this.height=0.20,required this.function
  });
final Widget widget;
final double width;
final double height;
final Function function;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: ColorsP.containerCardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizesP.itemRadius)),
      child: InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width*width,
          height: MediaQuery.of(context).size.height*height,
          child: widget,
      
      
        ),
        onTap: (){
          function();
        },
      ),
    );
  }
}