import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/auth/viewmodel/auth_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';
import 'package:kindergartenapp/product/widgets/loginWidgets/button_L.dart';
import 'package:kindergartenapp/product/widgets/wordColor_L.dart';
import 'package:pinput/pinput.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final AuthViewModel _authViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(title: "Doğrulama Kodu"),
      body: Padding(
        padding: SizesP.pagePadding,
        child: Column(
          children: [
            WordColor(
              text1: _authViewModel.phoneController.value.text,
              text2:
                  " numaralı telefona,\nuygulamaya girebilmeni sağlayacak bir kod içeren bir SMS gönderdik.",
              text2Color: ColorsP.fashionableGrey,
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Pinput(
                onCompleted: (pin) => _authViewModel.otpCode = pin,
                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 64,
                  textStyle: TextStyle(color: ColorsP.primary),
                  decoration: BoxDecoration(
                    color: ColorsP.otpColor,
                    borderRadius: BorderRadius.circular(SizesP.itemRadius),
                  ),
                ),
              ),
            ),
            Spacer(),
            Button_L(text: "Gönder", function: _authViewModel.loginOtp),
          ],
        ),
      ),
    );
  }
}
