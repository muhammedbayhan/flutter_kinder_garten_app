import 'package:get/get.dart';
import 'package:kindergartenapp/feature/teacher/splash/viewmodel/teacher_splash_view_model.dart';
import 'package:kindergartenapp/feature/teacher/studentList/model/student_model.dart';
import 'package:kindergartenapp/feature/teacher/studentList/service/student_service.dart';

class TeacherStudentListViewModel extends GetxController {
  @override
  void onInit() {
    getStudents();
    super.onInit();
  }

  final TeacherSplashViewModel _teacherSplashViewModel =
      Get.put(TeacherSplashViewModel());

  String? studentName;
  String? studentAge;
  String? studentGender;
  String? studentParentId;
  String? studentSchoolId;
  String? studentClassesId;
  String? studentId;

  RxList<StudentModel>? students = <StudentModel>[].obs; // Make it a RxList
  final StudentService _studentService = StudentService();

  Future<void> getStudents() async {
    final List<StudentModel>? result = await _studentService.getStudents(
        teacherId: _teacherSplashViewModel.teacherId!);
    if (result != null) {
      students!.assignAll(result);
      print(students!.length);
    } else {
      Get.snackbar("Hata", "Öğrenci Bulunamadı!");
    }
  }
}
