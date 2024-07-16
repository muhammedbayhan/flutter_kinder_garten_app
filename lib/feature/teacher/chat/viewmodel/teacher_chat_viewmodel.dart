import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/teacher/chat/model/conversation_model.dart';
import 'package:kindergartenapp/feature/teacher/chat/model/message_model.dart';
import 'package:kindergartenapp/feature/teacher/chat/model/teacher_parents_model.dart';
import 'package:kindergartenapp/feature/teacher/chat/service/teacher_chat_service.dart';
import 'package:kindergartenapp/feature/teacher/splash/viewmodel/teacher_splash_view_model.dart';

class TeacherChatViewModel extends GetxController {
  final TeacherSplashViewModel _teacherSplashViewModel =
      Get.put(TeacherSplashViewModel());



  RxList<TeacherParentsModel>? parents = <TeacherParentsModel>[].obs; // Make it a RxList
  RxList<ConversationsModel>? conversations = <ConversationsModel>[].obs;
  RxList<MessageModel>? message= <MessageModel>[].obs;
   // Make it a RxList
  final TeacherChatService _teacherChatService = TeacherChatService();
  String? parentName;
  String? parentPhone;
  String? parentId;
  String? channelId;
TextEditingController textController=TextEditingController();


  Future<void> getParents() async {
    final List<TeacherParentsModel>? result = await _teacherChatService.getParents(teacherId:  _teacherSplashViewModel.teacherId!);
    if (result != null) {
      parents!.assignAll(result);
      print(parents!.length);
    } else {
      Get.snackbar("Hata", "Veli Bulunamadı1!");
    }
  }

  Future<void> getConversations() async {
    final List<ConversationsModel>? result = await _teacherChatService.getConversations();
    if (result != null) {
      conversations!.assignAll(result);
            update();

      print(parents!.length);
    } else {
      Get.snackbar("Hata", "Veli Bulunamadı2!");
    }
  }


    Future<void> getMessage() async {
    final List<MessageModel>? result = await _teacherChatService.getMessage(receiverId: parentId!);
    if (result != null) {
      message!.assignAll(result);
            update();

      print(parents!.length);
    } else {
      Get.snackbar("Hata", "Veli Bulunamadı3!");
    }
  }


    //post

  Future<void> postMessage() async {
    try {
      await _teacherChatService.postMessage(parentId!, textController.text);
      textController.clear();
      update();
      
     

    } catch (e) {
      Get.snackbar("Hata", "Mesaj Gönderilmedi!");
    }
  }
}
