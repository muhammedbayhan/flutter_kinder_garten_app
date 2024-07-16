import 'package:flutter/material.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';

class MedicationTrackingItem extends StatelessWidget {
  const MedicationTrackingItem({
    super.key,required this.medicationDate,required this.medicationTitle,required this.medicationDetail
  });

final String medicationDate;
final String medicationTitle;
final String medicationDetail;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizesP.itemRadius)),
        color: ColorsP.white,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset("assets/images/pill.png")
                      , Text(medicationDate)],
                  ),
                ),
           Padding(
                padding: const EdgeInsets.only(right: 16,left: 16),
                child: Divider(
                  thickness: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(medicationTitle,style: Theme.of(context).textTheme.titleMedium,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                  Text(medicationDetail),
               
                  ],
                ),),
              )
              ]),
        ));
  }
}
