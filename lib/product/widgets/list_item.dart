import 'package:flutter/material.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,required this.index,required this.date,required this.content
  });
final int index;
final String date;
final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading:Text("${index + 1}",style: Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorsP.fashionableGrey),) ,
        title: Text(date,style: Theme.of(context).textTheme.titleLarge!.copyWith(),),
        subtitle: Text(content),
      ),
 
    );
  }
}
