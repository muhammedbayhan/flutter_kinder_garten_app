import 'package:flutter/material.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.height,
    required this.controller,
    this.expands = true,
    this.maxLines = null,
  });
  final String hintText;
  final double height;
  final TextEditingController controller;
  final bool expands;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        expands: expands,
        maxLines: maxLines,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: ColorsP.fashionableGrey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizesP.itemRadius),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: EdgeInsets.all(16),
        ),
      ),
    );
  }
}
