import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/auth/viewmodel/auth_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/loginWidgets/button_L.dart';
import 'package:kindergartenapp/product/widgets/wordColor_L.dart';
import 'package:kindergartenapp/product/widgets/svg_positioned.dart';
import 'package:kindergartenapp/product/widgets/loginWidgets/textfield_phoneFormat.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final AuthViewModel _authViewModel = Get.put(AuthViewModel());

  final maskFormatter = MaskTextInputFormatter(
      mask: '0### ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            //Login ekranındaki dairelerin konumu
            SvgPositioned(
              top: -125,
              right: -100,
            ),
            SvgPositioned(
              top: -200,
              left: -75,
            ),
            SvgPositioned(
              bottom: -20,
              left: -20,
              imageheight: 100,
            ),
            SvgPositioned(
              bottom: 50,
              left: 70,
              imageheight: 50,
            ),

            Padding(
              padding: SizesP.pagePadding,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Spacer(
                  flex: 30,
                ),
                Expanded(
                    flex: 10,
                    child: Text(
                      "Merhaba",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: ColorsP.black,
                              fontWeight: FontWeight.bold),
                    )),
                Expanded(
                    flex: 10,
                    child: WordColor(
                        text1: "Anaokulu ", text2: "uygulamasına hoşgeldin!")),
                Expanded(
                    flex: 10,
                    child: TextfieldPhoneFormat(
                      controller: _authViewModel.phoneController,
                      maskFormatter: maskFormatter,
                    )),
                Expanded(
                    flex: 7,
                    child: Button_L(
                      text: "Giriş Yap",
                      function: _authViewModel.loginPhone,
                    )),
                const Spacer(
                  flex: 30,
                ),
              ]),
            ),
          ],
        ));
  }
}
