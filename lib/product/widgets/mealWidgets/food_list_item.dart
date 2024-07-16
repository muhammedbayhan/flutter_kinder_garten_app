import 'package:flutter/material.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem(
      {super.key,
      required this.date,
      required this.mainDish,
      required this.appetizer,
      required this.soup,
      required this.dessert,
      required this.drink});
  final String date;
  final String mainDish;
  final String appetizer;
  final String soup;
  final String dessert;
  final String drink;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ListTile(
        title: Text(date),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ana Yemek: $mainDish",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorsP.fashionableGrey),
              ),
              Text(
                "Meze: $appetizer",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorsP.fashionableGrey),
              ),
              Text(
                "Çorba: $soup",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorsP.fashionableGrey),
              ),
              Text(
                "Tatlı: $dessert",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorsP.fashionableGrey),
              ),
              Text(
                "İçecek: $drink",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorsP.fashionableGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
