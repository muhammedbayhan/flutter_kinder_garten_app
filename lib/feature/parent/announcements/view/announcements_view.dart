import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/announcements/viewmodel/announcements_view_model.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/list_item.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';

class AnnouncementsView extends StatelessWidget {
  AnnouncementsView({super.key});
  final AnnouncementsViewModel _announcementsViewModel =
      Get.put(AnnouncementsViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(title: "Duyurular"),
      body: Padding(
        padding: SizesP.pagePadding,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/teacherannouncement.png",
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Divider(
                  thickness: 3,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _announcementsViewModel.announcements!.length,
                    itemBuilder: (context, index) {
                      return ListItem(
                        index: index,
                        date: _announcementsViewModel
                            .announcements![index].title!,
                        content: _announcementsViewModel
                            .announcements![index].content!,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
