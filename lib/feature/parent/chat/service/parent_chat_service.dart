import 'package:kindergartenapp/feature/parent/chat/model/parent_conversation_model.dart';
import 'package:kindergartenapp/feature/parent/chat/model/parent_message_model.dart';
import 'package:kindergartenapp/feature/parent/chat/model/student_teacher_model.dart';
import 'package:kindergartenapp/product/network/network_manager.dart';

class ParentChatService {
  final NetworkManager _networkManager = NetworkManager.instance;

  Future<List<StudentTeacherModel>?> getTeachers({required String schoolId}) async {
    var response = await _networkManager.dio.get(
      "/teachers?school=$schoolId",
    );
    if (response.statusCode == 200) {
      final datas = response.data["results"];
      print(datas);
      if (datas is List) {
        return datas.map((e) => StudentTeacherModel.fromJson(e)).toList();
      }
    }

    return null;
  }


    Future<List<ParentConversationsModel>?> getConversations() async {
    var response = await _networkManager.dio.get(
      "/chat/user-conversations",
    );
    if (response.statusCode == 200) {
      final datas = response.data;
      print(datas);
      if (datas is List) {
        return datas.map((e) => ParentConversationsModel.fromJson(e)).toList();
      }
    }

    return null;
  }


  
  Future<List<ParentMessageModel>?> getMessage({required String receiverId}) async {
    var response = await _networkManager.dio.get(
      "/chat/messages?receiverId=$receiverId",
    );
    if (response.statusCode == 200) {
      final datas = response.data;
      print(datas);
      if (datas is List) {
        return datas.map((e) => ParentMessageModel.fromJson(e)).toList();
      }
    }

    return null;
  }

  //post
   Future<void> postMessage(String receiverId,String text,) async {
    try {
      final response =await _networkManager.dio.post("/chat/send-message",
          data: 
    {
  "receiverId": receiverId,
  "message": {
    "text":text,
    "type": "text"
  }
});

      if (response.statusCode == 200) {
        print("Eklendi");
 
      }
    } catch (e) {
      print(e);
    }
  }
}
