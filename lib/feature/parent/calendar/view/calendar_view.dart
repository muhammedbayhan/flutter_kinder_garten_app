import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/calendar/viewmodel/calendar_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';
import 'package:time_planner/time_planner.dart';





class CalendarView extends StatelessWidget {
   CalendarView({Key? key,}) : super(key: key);
  final CalendarViewModel _calendarViewModel =
      Get.put(CalendarViewModel());




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(title: "Ders Programı"),
      body: Center(
        child: 
      Obx(
        ()=> TimePlanner(
              
              currentTimeAnimation: false,
              startHour: 8,
              endHour: 20,
              use24HourFormat: true,
              setTimeOnAxis: false,
              style: TimePlannerStyle(
                borderRadius: const BorderRadius.all(Radius.circular(0)),
            
      
                showScrollBar: true,
                interstitialEvenColor: ColorsP.white,
                interstitialOddColor: ColorsP.white,
                dividerColor: ColorsP.white,
            
              
              ),
              headers: const [
                TimePlannerTitle(
                  
                  title: "Pazartesi",
                ),
                TimePlannerTitle(
                  title: "Salı",
                ),
                TimePlannerTitle(
                  title: "Çarşamba",
                ),
                TimePlannerTitle(
                  title: "Perşembe",
                ),
                TimePlannerTitle(
                  
                  title: "Cuma",
                ),
                   
            
              ],
              // ignore: invalid_use_of_protected_member
              tasks: _calendarViewModel.tasks.value,
            ),
      ),
        ),
    
    
    );
  }
}