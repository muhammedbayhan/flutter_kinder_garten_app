import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kindergartenapp/feature/parent/dailyReport/viewmodel/daily_report_view_model.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/list_item.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';

class DailyReportView extends StatelessWidget {
  DailyReportView({super.key});
  final DailyReportViewModel _dailyReportViewModel =
      Get.put(DailyReportViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(title: "Gün Sonu Raporu"),
      body: Padding(
        padding: SizesP.pagePadding,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset("assets/svg/dailyreport.svg",
                  height: MediaQuery.of(context).size.height * 0.3),
              const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Divider(
                  thickness: 3,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _dailyReportViewModel.reports!.length,
                    itemBuilder: (context, index) {
                      return ListItem(
                        index: index,
                        content:
                            _dailyReportViewModel.reports![index].content!,
                        date: Intl.withLocale('tr', () => DateFormat('dd MMMM yyyy EEEE').format(
                            DateTime.parse(
                                _dailyReportViewModel.reports![index].date!)),)
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
