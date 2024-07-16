import 'package:kindergartenapp/feature/teacher/chat/model/conversation_model.dart';
import 'package:kindergartenapp/feature/teacher/chat/model/message_model.dart';
import 'package:kindergartenapp/feature/teacher/chat/model/teacher_parents_model.dart';
import 'package:kindergartenapp/product/network/network_manager.dart';

class TeacherChatService {
  final NetworkManager _networkManager = NetworkManager.instance;

  Future<List<TeacherParentsModel>?> getParents({required String teacherId}) async {
    var response = await _networkManager.dio.get(
      "/teachers/$teacherId/parents",
    );
    if (response.statusCode == 200) {
      final datas = response.data;
      print(datas);
      if (datas is List) {
        return datas.map((e) => TeacherParentsModel.fromJson(e)).toList();
      }
    }

    return null;
  }


    Future<List<ConversationsModel>?> getConversations() async {
    var response = await _networkManager.dio.get(
      "/chat/user-conversations",
    );
    if (response.statusCode == 200) {
      final datas = response.data;
      print(datas);
      if (datas is List) {
        return datas.map((e) => ConversationsModel.fromJson(e)).toList();
      }
    }

    return null;
  }


  
  Future<List<MessageModel>?> getMessage({required String receiverId}) async {
    var response = await _networkManager.dio.get(
      "/chat/messages?receiverId=$receiverId",
    );
    if (response.statusCode == 200) {
      final datas = response.data;
      print(datas);
      if (datas is List) {
        return datas.map((e) => MessageModel.fromJson(e)).toList();
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
