import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';

class WordColor extends StatelessWidget {
   const WordColor({
    super.key,required this.text1,required this.text2,this.text1Color=ColorsP.primary,this.text2Color=ColorsP.black
  });
final String text1;
final String text2;
final Color text1Color;
final Color text2Color;
  @override
  Widget build(BuildContext context) {
    return RichText(
    text: TextSpan(
    text: text1,
    style: GoogleFonts.lexend(color: text1Color),// TextStyle(color: text1Color,), TextStyle(color: text2Color)
    children: <TextSpan>[
    TextSpan(text: text2,style:GoogleFonts.lexend(color: text2Color), ),
    ],
  ),
);
  }
}