import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/calendar/model/calendar_model.dart';
import 'package:kindergartenapp/feature/parent/calendar/service/calendar_service.dart';
import 'package:kindergartenapp/feature/teacher/calendar/service/teacher_calendar_service.dart';
import 'package:kindergartenapp/feature/teacher/splash/viewmodel/teacher_splash_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:time_planner/time_planner.dart';

class TeacherCalendarViewModel extends GetxController {
  @override
  void onInit() {
    getCalendar();
    super.onInit();
  }
  
  final TeacherSplashViewModel _teacherSplashViewModel =
      Get.put(TeacherSplashViewModel());
  TextEditingController lessonNameController = TextEditingController();
  late RxList<CalendarModel>? calendarItems =
      <CalendarModel>[].obs; // Make it a RxList
  final CalendarService _calendarService = CalendarService();
  final TeacherCalendarService _teacherCalendarService =
      TeacherCalendarService();
  List<Color?> colors = [
    ColorsP.primary,
    const Color.fromARGB(255, 233, 171, 90),
    const Color.fromARGB(255, 78, 124, 252),
    const Color.fromARGB(255, 253, 106, 106),
    const Color.fromARGB(255, 240, 60, 150),
  
  ];
  Future<void> getCalendar() async {
    final List<CalendarModel>? result = await _calendarService.getCalendar(
        classId: _teacherSplashViewModel.teacherclasses!);
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
        onTap: () {
          deleteAnnouncements(i.id!);

          getCalendar();
        },
        child: Text(
          i.lessonName!,
          style: const TextStyle(color: ColorsP.white),
        ),
      ));
    }
  }

  //delete

  Future<void> deleteAnnouncements(String id) async {
    try {
      await _teacherCalendarService.deleteCalendarItem(id);
      tasks.clear();
      getCalendar();
      update();
      tasks.refresh();

      Get.snackbar("Silindi", "Ders başarı ile silindi!");
    } catch (e) {
      Get.snackbar("Hata", "Ders Bulunamadı!");
    }
  }

  //post

  Future<void> postCalendarItem(
      int nameOfDay, int hour, int minute, int lessonDuration) async {
    try {
      await _teacherCalendarService.postCalendarItem(
          lessonNameController.text,
          nameOfDay,
          hour,
          minute,
          lessonDuration,
          _teacherSplashViewModel.teacherSchoolId!,
          _teacherSplashViewModel.teacherclasses!);
      lessonNameController.clear();
      getCalendar();
      update();
      Get.snackbar("Eklendi", "Ders başarı ile eklendi!");
    } catch (e) {
      Get.snackbar("Hata", "Ders Bulunamadı!");
    }
  }
}
