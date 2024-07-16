import 'package:get/route_manager.dart';
import 'package:kindergartenapp/feature/auth/view/login_view.dart';
import 'package:kindergartenapp/feature/auth/view/verification_view.dart';
import 'package:kindergartenapp/feature/parent/base/base_scaffold.dart';
import 'package:kindergartenapp/feature/parent/announcements/view/announcements_view.dart';
import 'package:kindergartenapp/feature/parent/calendar/view/calendar_view.dart';
import 'package:kindergartenapp/feature/parent/dailyReport/view/daily_report_view.dart';
import 'package:kindergartenapp/feature/parent/medicationTracking/view/medication_tracking_view.dart';
import 'package:kindergartenapp/feature/parent/parentChildren/view/parent_children_view.dart';
import 'package:kindergartenapp/feature/common/splash/splash_view.dart';
import 'package:kindergartenapp/feature/teacher/announcements/view/teacher_announcements_view.dart';
import 'package:kindergartenapp/feature/teacher/base/teacher_base_scaffold.dart';
import 'package:kindergartenapp/feature/teacher/calendar/view/teacher_calendar_view.dart';
import 'package:kindergartenapp/feature/teacher/foodList/view/teacher_foodlist_view.dart';
import 'package:kindergartenapp/feature/teacher/gallery/view/teacher_gallery_settings_view.dart';
import 'package:kindergartenapp/feature/teacher/studentList/view/teacher_student_list_view.dart';
import 'package:kindergartenapp/feature/teacher/studentOperations/Operations/dailyReport/view/teacher_daily_report_view.dart';
import 'package:kindergartenapp/feature/teacher/studentOperations/Operations/medicationTracking/view/teacher_medication_tracking_view.dart';
import 'package:kindergartenapp/feature/teacher/studentOperations/view/teacher_student_operations.dart';

class AppRoutes {

  //auth routes
  static const String splash = "/";
  static const String login = "/login";
  static const String verification = "/verification";

//parent routes
  static const String selectStudent = "/selectStudent";
  static const String baseScaffold = "/baseScaffold";
  static const String calendar = "/calendar";
  static const String dailyReport = "/dailyReport";
  static const String medicationTracking = "/medicationTracking";
  static const String announcementsView = "/announcementsView";


  //teacher routes
    static const String teacherBaseScaffold = "/teacherBaseScaffold";
    static const String teacherAnnouncements = "/teacherAnnouncements";
    static const String teacherFoodList = "/teacherFoodList";
    static const String teacherStudentList = "/teacherStudentList";
    static const String teacherCalendar = "/teacherCalendar";
    static const String teacherStudentOperations = "/teacherStudentOperations";
    static const String teacherDailyReport = "/teacherDailyReport";
    static const String teacherMedicationTracking = "/teacherMedicationTracking";
    static const String teacherGallerySettings = "/teacherGallerySettings";


  static List<GetPage> routes =[
    GetPage(
          
          name: splash,
          page: () => SplashView(),
      transitionDuration: const Duration(milliseconds: 250)
        ),
        GetPage(
          name: login,
          page: () => LoginView(),
               transitionDuration: const Duration(milliseconds: 250)

        ),
             GetPage(
          name: verification,
          page: () =>const VerificationView(),
               transitionDuration: const Duration(milliseconds: 250)

        ),
                 GetPage(
          name: selectStudent,
          page: () => ParentChildrenView(),
                transitionDuration: const Duration(milliseconds: 250)

        ),
             GetPage(
          name: baseScaffold,
          page: () => const BaseScaffoldView(),
                transitionDuration: const Duration(milliseconds: 250)
              

        ),

            GetPage(
          name: calendar,
          page: () => CalendarView(),
                transitionDuration: const Duration(milliseconds: 250)

        ),
            GetPage(
          name: dailyReport,
          page: () => DailyReportView(),
                transitionDuration: const Duration(milliseconds: 250)

        ),
          GetPage(
          name: medicationTracking,
          page: () => MedicationTrackingView(),
                transitionDuration: const Duration(milliseconds: 250)

        ),
          GetPage(
          name: announcementsView,
          page: () => AnnouncementsView(),
                transitionDuration: const Duration(milliseconds: 250)

        ),



        //teacher routes
               GetPage(
          name: teacherBaseScaffold,
          page: () =>const TeacherBaseScaffoldView(),
                transitionDuration: const Duration(milliseconds: 250)
              

        ),
        GetPage(
          name: teacherAnnouncements,
          page: () => const TeacherAnnouncementsView(),
                transitionDuration: const Duration(milliseconds: 250)
              

        ),

             GetPage(
          name: teacherFoodList,
          page: () => const TeacherFoodListView(),
                transitionDuration: const Duration(milliseconds: 250)
              

        ),

                 GetPage(
          name: teacherStudentList,
          page: () => TeacherStudentListView(),
                transitionDuration: const Duration(milliseconds: 250)
              

        ),
                    GetPage(
          name: teacherCalendar,
          page: () => const TeacherCalendarView(),
                transitionDuration: const Duration(milliseconds: 250)
              

        ),

         GetPage(
          name: teacherStudentOperations,
          page: () => TeacherStudentOperationsView(),
                transitionDuration: const Duration(milliseconds: 250)
              

        ),
           GetPage(
          name: teacherDailyReport,
          page: () => const TeacherDailyReportView(),
                transitionDuration: const Duration(milliseconds: 250)
              

        ),

         GetPage(
          name: teacherMedicationTracking,
          page: () => TeacherMedicationView(),
                transitionDuration: const Duration(milliseconds: 250)
              

        ),
             GetPage(
          name: teacherGallerySettings,
          page: () => TeacherGallerySettingsView(),
                transitionDuration: const Duration(milliseconds: 250)
              

        ),
     
     
  ];
}
