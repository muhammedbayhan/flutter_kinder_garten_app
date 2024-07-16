import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kindergartenapp/feature/parent/medicationTracking/viewmodel/medication_tracking_view_model.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';
import 'package:kindergartenapp/product/widgets/medicationTrackingWidgets/medicationTracking_item.dart';

class MedicationTrackingView extends StatelessWidget {
  MedicationTrackingView({super.key});
  final MedicationTrackingViewModel _medicationTrackingViewModel =
      Get.put(MedicationTrackingViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(title: "İlaç Takip"),
      body: Padding(
        padding: SizesP.pagePadding,
        child: Obx(
          () => ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _medicationTrackingViewModel.medicines!.length,
              itemBuilder: (context, index) {
                return MedicationTrackingItem(
                  medicationDate: Intl.withLocale("tr", () => DateFormat('dd MMMM yyyy EEEE').format(
                      DateTime.parse(_medicationTrackingViewModel
                          .medicines![index].date!)),),
                  medicationTitle: _medicationTrackingViewModel
                      .medicines![index].medicine!,
                  medicationDetail:
                      _medicationTrackingViewModel.medicines![index].detail!,
                );
              }),
        ),
      ),
    );
  }
}
