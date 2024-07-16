import 'package:flutter/material.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';


class ChatInputField extends StatelessWidget {
   ChatInputField({super.key,required this.controller,required this.function});
  TextEditingController controller =TextEditingController();
   Function function;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16 ,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: ColorsP.primary.withOpacity(0.1),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            const Icon(Icons.mic, color: ColorsP.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16 * 0.75,
                ),
                decoration: BoxDecoration(
                  color: ColorsP.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
               
                    const SizedBox(width: 16 / 4),
                     Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: "Bir mesaj yaz...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.attach_file,
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.64),
                    ),
                    const SizedBox(width: 16 / 4),
                   IconButton(onPressed: (){function();}, icon: const Icon(Icons.send_rounded,color: ColorsP.primary,))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}