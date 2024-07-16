import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';

class Button_L extends StatelessWidget {
  const Button_L({super.key, required this.text, required this.function});
  final String text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.065,
        child: ElevatedButton(
          onPressed: () {
            if (text != 14) {
              function();
            } else {
              Get.snackbar("HATA", "Lütfen telefon numaranızı kontrol ediniz.");
            }
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizesP.itemRadius))),
          child: Text(text),
        ));
  }
}
