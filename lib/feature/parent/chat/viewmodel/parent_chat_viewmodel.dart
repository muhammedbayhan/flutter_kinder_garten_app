

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/chat/model/parent_conversation_model.dart';
import 'package:kindergartenapp/feature/parent/chat/model/parent_message_model.dart';
import 'package:kindergartenapp/feature/parent/chat/model/student_teacher_model.dart';
import 'package:kindergartenapp/feature/parent/chat/service/parent_chat_service.dart';
import 'package:kindergartenapp/feature/parent/parentChildren/viewmodel/parent_children_view_model.dart';

class ParentChatViewModel extends GetxController {



  RxList<StudentTeacherModel>? teachers = <StudentTeacherModel>[].obs; // Make it a RxList
  RxList<ParentConversationsModel>? conversations = <ParentConversationsModel>[].obs;
  RxList<ParentMessageModel>? message= <ParentMessageModel>[].obs;
   // Make it a RxList
  final ParentChatService _parentChatService = ParentChatService();
  String? teacherName;
  String? teacherPhone;
  String? teacherId;
  String? channelId;
TextEditingController textController=TextEditingController();
 final ParentChildrenViewModel _parentChildrenViewModel =
      Get.put(ParentChildrenViewModel());

  Future<void> getTeachers() async {
    final List<StudentTeacherModel>? result = await _parentChatService.getTeachers(schoolId: _parentChildrenViewModel.studentSchoolId!);
    if (result != null) {
      print(result);
      teachers!.assignAll(result);
    } else {
      Get.snackbar("Hata", "Veli Bulunamadı1!");
    }
  }

  Future<void> getConversations() async {
    final List<ParentConversationsModel>? result = await _parentChatService.getConversations();
    if (result != null) {
      conversations!.assignAll(result);
            update();

      print(conversations!.length);
    } else {
      Get.snackbar("Hata", "Veli Bulunamadı2!");
    }
  }


    Future<void> getMessage() async {
    final List<ParentMessageModel>? result = await _parentChatService.getMessage(receiverId: teacherId!);
    if (result != null) {
      message!.assignAll(result);
            update();

      print(message!.length);
    } else {
      Get.snackbar("Bilgilendirme", "Bu kullanıcıyla ilk defa mesajlaşıyorsunuz, ilk mesajınızı attıktan sonra ana mesajlar sayfasına dönüp sohbete devam edebilirsiniz.");
    }
  }


    //post

  Future<void> postMessage() async {
    try {
      await _parentChatService.postMessage(teacherId!, textController.text);
      textController.clear();
      update();
      
     

    } catch (e) {
      Get.snackbar("Hata", "Mesaj Gönderilmedi!");
    }
  }
}
