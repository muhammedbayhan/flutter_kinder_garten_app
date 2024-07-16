import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/calendar/model/calendar_model.dart';
import 'package:kindergartenapp/feature/parent/calendar/service/calendar_service.dart';
import 'package:kindergartenapp/feature/parent/parentChildren/viewmodel/parent_children_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:time_planner/time_planner.dart';

class CalendarViewModel extends GetxController {
  @override
  void onInit() {
    getCalendar();
    super.onInit();
  }

  final ParentChildrenViewModel _parentChildrenViewModel =
      Get.put(ParentChildrenViewModel());

  late RxList<CalendarModel>? calendarItems =
      <CalendarModel>[].obs; // Make it a RxList
  final CalendarService _calendarService = CalendarService();
  List<Color?> colors = [
    ColorsP.primary,
    const Color.fromARGB(255, 233, 171, 90),
    const Color.fromARGB(255, 78, 124, 252),
    const Color.fromARGB(255, 253, 106, 106),
    const Color.fromARGB(255, 240, 60, 150),
  ];
  Future<void> getCalendar() async {
    final List<CalendarModel>? result = await _calendarService.getCalendar(
        classId: _parentChildrenViewModel.studentClassesId!);
    if (result != null) {
      calendarItems!.assignAll(result);
      print(calendarItems!.length);
      getLessons();
    } else {
      Get.snackbar("Hata", "Ders Programı Bulunamadı!");
    }
  }

  var tasks = <TimePlannerTask>[].obs;

  void getLessons() {
    for (var i in calendarItems!) {
      tasks.add(TimePlannerTask(
        color: colors[Random().nextInt(colors.length)],
        dateTime: TimePlannerDateTime(
          day: i.nameOfDay!,
          hour: i.hour!,
          minutes: i.minute!,
        ),
        minutesDuration: i.lessonDuration!,
        daysDuration: 1,
        onTap: () {},
        child: Text(
          i.lessonName!,
          style: const TextStyle(color: ColorsP.white),
        ),
      ));
    }
  }
}
