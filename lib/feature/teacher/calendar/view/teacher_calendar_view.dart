import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/teacher/calendar/viewmodel/teacher_calendar_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/custom_textfield.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';
import 'package:time_planner/time_planner.dart';

class TeacherCalendarView extends StatefulWidget {
  const TeacherCalendarView({Key? key}) : super(key: key);

  @override
  _TeacherCalendarViewState createState() => _TeacherCalendarViewState();
}

class _TeacherCalendarViewState extends State<TeacherCalendarView>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  final PageController pageController = PageController();
  final TeacherCalendarViewModel _calendarViewModel =
      Get.put(TeacherCalendarViewModel());
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration:const Duration(milliseconds: 260),
    );
    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        _ViewCalendar(
            animationController: _animationController,
            animation: _animation,
            calendarViewModel: _calendarViewModel,
            pageController: pageController),
        _AddCalendar(
            animationController: _animationController,
            animation: _animation,
            calendarViewModel: _calendarViewModel,
            pageController: pageController),
      ],
    );
  }
}

class _ViewCalendar extends StatelessWidget {
  const _ViewCalendar({
    required AnimationController animationController,
    required Animation<double> animation,
    required TeacherCalendarViewModel calendarViewModel,
    required PageController pageController,
  })  : _animationController = animationController,
        _animation = animation,
        _calendarViewModel = calendarViewModel,
        _pageController = pageController;

  final AnimationController _animationController;
  final Animation<double> _animation;
  final TeacherCalendarViewModel _calendarViewModel;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionBubble(
        // Menu items
        items: <Bubble>[
          Bubble(
            title: "Sil",
            iconColor: Colors.white,
            bubbleColor: ColorsP.primary,
            icon: Icons.delete,
            titleStyle:const TextStyle(color: ColorsP.white),
            onPress: () {
              _animationController.reverse();
              Get.snackbar(
                  "Bilgi", "Silmek istediğiniz dersin üzerine tıklayınız.");
            },
          ),
          Bubble(
              title: "Ekle",
              iconColor: Colors.white,
              bubbleColor: ColorsP.primary,
              icon: Icons.add,
              titleStyle: const TextStyle(color: ColorsP.white),
              onPress: () {
                _pageController.nextPage(
                    duration:const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                _animationController.reverse();
              }),
          // Floating action menu item
        ],

        // animation controller
        animation: _animation,

        // On pressed change animation state
        onPress: () => _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward(),

        // Floating Action button Icon color
        iconColor: ColorsP.white,

        // Flaoting Action button Icon
        iconData: Icons.settings,
        backGroundColor: ColorsP.primary,
      ),
      appBar: DetailAppBar(title: "Takvim"),
      body: Center(
        child: Obx(
          () => TimePlanner(
            currentTimeAnimation: false,
            startHour: 8,
            endHour: 20,
            use24HourFormat: true,
            setTimeOnAxis: false,
            style: TimePlannerStyle(
              borderRadius:const BorderRadius.all(Radius.circular(0)),
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

class _AddCalendar extends StatefulWidget {
  const _AddCalendar({
    required AnimationController animationController,
    required Animation<double> animation,
    required TeacherCalendarViewModel calendarViewModel,
    required PageController pageController,
  })  : _animationController = animationController,
        _animation = animation,
        _calendarViewModel = calendarViewModel,
        _pageController = pageController;

  final AnimationController _animationController;
  final Animation<double> _animation;
  final TeacherCalendarViewModel _calendarViewModel;
  final PageController _pageController;

  @override
  State<_AddCalendar> createState() => _AddCalendarState();
}

class _AddCalendarState extends State<_AddCalendar> {
  DateTime date = DateTime.now();

  final List<String> _daysOfWeek = [
    'Pazartesi',
    'Salı',
    'Çarşamba',
    'Perşembe',
    'Cuma',
  ];
  int selectedYear = 1;

  String nameOfday = "Pazartesi";
  int nameOfdayIndex = 0;
  int lessonDuration = 0;
  int hour=0;
  int minute=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionBubble(
          // Menu items
          items: <Bubble>[
            // Floating action menu item
            Bubble(
              title: "Geri Dön",
              iconColor: Colors.white,
              bubbleColor: ColorsP.primary,
              icon: Icons.search,
              titleStyle:const TextStyle(color: ColorsP.white),
              onPress: () {
                widget._pageController.previousPage(
                    duration:const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                widget._animationController.reverse();
              },
            ),

            // Floating action menu item
          ],

          // animation controller
          animation: widget._animation,

          // On pressed change animation state
          onPress: () => widget._animationController.isCompleted
              ? widget._animationController.reverse()
              : widget._animationController.forward(),

          // Floating Action button Icon color
          iconColor: ColorsP.white,

          // Flaoting Action button Icon
          iconData: Icons.settings,
          backGroundColor: ColorsP.primary,
        ),
        appBar: AppBar(leading:const SizedBox.shrink(),title: Text("Ders Ekle"
        ,style: Theme.of(context)
            .textTheme
            .headlineSmall!.copyWith(fontWeight: FontWeight.bold),
        ),centerTitle: true,),
        body: Padding(
          padding: SizesP.pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
             const SizedBox(height: 10,),
              Image.asset("assets/images/addCalendar.png",fit: BoxFit.cover,),
              CustomTextField(hintText: "Ders Adı", height:50, controller: widget._calendarViewModel.lessonNameController,expands: false,maxLines: 1),
           const SizedBox(height: 10,),
              DataTable(
                  border: TableBorder.all(
                    style: BorderStyle.none,
                    width: 2,
                    borderRadius:const BorderRadius.all(Radius.circular(5)),
                    color: ColorsP.primary,
                  ),
                  horizontalMargin: 10,
                  checkboxHorizontalMargin: 5,
                  showCheckboxColumn: false,
                  columns: const [
                    DataColumn(
                      label: Expanded(
                          child: Center(
                              child: Text(
                        'Gün',
                        textAlign: TextAlign.center,
                      ))),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Center(
                              child: Text(
                        'Saat',
                        textAlign: TextAlign.center,
                      ))),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Center(
                              child: Text(
                        'Ders süresi   ',
                        textAlign: TextAlign.center,
                      ))),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Center(
                          child: TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoPicker(
                                    itemExtent: 40.0,
                                    onSelectedItemChanged: (int index) {
                                      // Handle selected item
                                      print("Selected day: ${_daysOfWeek[index]}");
                                      setState(() {
                                        nameOfday = _daysOfWeek[index];
                                        nameOfdayIndex = index;
                                      });
                                      print(nameOfdayIndex);
                                    },
                                    children: List<Widget>.generate(
                                        _daysOfWeek.length, (int index) {
                                      return Center(
                                        child: Text(_daysOfWeek[index]),
                                      );
                                    }),
                                  ),
                                );
                              },
                              child: Text(
                                nameOfday,
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              )))),
                      DataCell(Center(
                        child: TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoDatePicker(
                                  initialDateTime: date,
                                  mode: CupertinoDatePickerMode.time,
                                  use24hFormat: true,
                                  onDateTimeChanged: (DateTime newDate) {
                                    setState(() {
                                      date = newDate;
                                      hour=newDate.hour;
                                      minute=newDate.minute;
                                      print(date.day);
                                      print(date.hour);
                                    });
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "${date.hour}:${date.minute}",
                              style:const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            )),
                      )),
                      DataCell(Center(
                          child: TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    minimumYear: 1,
                                    maximumYear: 300,
                                    use24hFormat: true,
                                    initialDateTime: DateTime(1, 1, 1),
                                    onDateTimeChanged: (DateTime newDate) {
                                      setState(() {
                                        int dateHourToMinute = newDate.hour * 60;
              
                                        lessonDuration =
                                            newDate.minute + dateHourToMinute;
                                      });
                                    },
                                  ),
                                );
                              },
                              child: Text("$lessonDuration dk")))),
                    ]),
                  ]),
                  ElevatedButton(onPressed: (){
                    widget._calendarViewModel.postCalendarItem(nameOfdayIndex, hour, minute, lessonDuration);
                     widget._pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                  }, child: const Text("Kaydet"))
            ],
          ),
        ));
  }
}


