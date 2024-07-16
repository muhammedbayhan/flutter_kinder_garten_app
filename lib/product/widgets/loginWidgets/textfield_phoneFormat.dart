import 'package:flutter/material.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';

// ignore: must_be_immutable
class TextfieldPhoneFormat extends StatelessWidget {
  TextfieldPhoneFormat(
      {super.key, required this.controller, required this.maskFormatter});
  TextEditingController controller = TextEditingController();
  var maskFormatter;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.left,
      // inputFormatters: [MaskTextInputFormatter(mask: "+### ###-##-##")],
      controller: controller,
      inputFormatters: [maskFormatter],
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: '555-555-55-55',
        hintStyle: const TextStyle(color: ColorsP.fashionableGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizesP.itemRadius),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
