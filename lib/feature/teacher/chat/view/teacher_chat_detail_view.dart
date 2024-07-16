import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/teacher/chat/model/message_model.dart';
import 'package:kindergartenapp/feature/teacher/chat/viewmodel/teacher_chat_viewmodel.dart';
import 'package:kindergartenapp/feature/teacher/splash/viewmodel/teacher_splash_view_model.dart';
import 'package:kindergartenapp/product/widgets/chatWidgets/chat_input.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class TeacherChatDetail extends StatefulWidget {
   const TeacherChatDetail({super.key});

  @override
  State<TeacherChatDetail> createState() => _TeacherChatDetailState();
}

class _TeacherChatDetailState extends State<TeacherChatDetail> {
     
        final TeacherChatViewModel _teacherChatViewModel =
      Get.put(TeacherChatViewModel());


    @override
  void initState() {
    _subscribe();
    _teacherChatViewModel.getMessage();
    
    
    super.initState();
  }

  @override
  void dispose() {
        _unsubscribe();
           _teacherChatViewModel.getConversations();


    _channel.sink.close();
    super.dispose();
  }

  void _subscribe() {
    _channel.sink.add(
        '{"event":"pusher:subscribe","data":{"auth":"","channel":"${_teacherChatViewModel.channelId}"}}');
  }

  void _unsubscribe() {
    _channel.sink.add(
        '{"event":"pusher:unsubscribe","data":{"auth":"","channel":"${_teacherChatViewModel.channelId}"}}');
  }

List<Map<String, dynamic>> messages = [];

  final _channel = WebSocketChannel.connect(
    Uri.parse(
        'wss://ws-eu.pusher.com/app/1fa5c190fd5ae5085ba8?protocol=7&client=js&version=8.2.0&flash=false'),
  );

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: DetailAppBar(title: _teacherChatViewModel.parentName!),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: StreamBuilder(
  stream: _channel.stream,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasData) {
      // Parse the incoming JSON data
      var jsonData = jsonDecode(snapshot.data);

      if (jsonData['event'] == 'pusher_internal:subscription_succeeded') {
        
return _MessageField(messages: _teacherChatViewModel.message);
      } else if (jsonData['event'] == 'new-message') {
        // Extract the message text and sender information from the data
        var messageData = jsonDecode(jsonData['data'])['message'];
        var messageText = messageData['text'];
        var sender = messageData['sender'];

        // Determine the alignment based on the sender

        // Update the UI with the message text and alignment
        //messages.add({'text': messageText, 'sender': isCurrentUser});
        _teacherChatViewModel.message!.add(MessageModel(conversation: "",id: "",text: messageText,sender: sender,receiver: "",sendAt: "",type: ""));


return _MessageField(messages: _teacherChatViewModel.message);
      } else {
      return const Center(child: CircularProgressIndicator());
      }
    } else {
      return const Text('An error occurred');
    }
  },
)
      ),
    );
  }
}

class _MessageField extends StatelessWidget {
   _MessageField({
    super.key,
    required this.messages,
  });
      final TeacherSplashViewModel _teacherSplashViewModel =
      Get.put(TeacherSplashViewModel());
          final TeacherChatViewModel _teacherChatViewModel =
      Get.put(TeacherChatViewModel());

  final RxList<MessageModel>? messages;

  @override
  Widget build(BuildContext context) {
    
    return Obx(
     ()=>Column(
        children: [
         
      
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages!.length,
            itemBuilder:(context,index){
                    final reversedIndex = messages!.length - 1 - index; // Ters sıralama için indeksi hesapla


                  return Align(
                  alignment: _teacherChatViewModel.message![reversedIndex].sender ==_teacherSplashViewModel.teacherUserId?AlignmentDirectional.topEnd:AlignmentDirectional.topStart,
                  child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: _teacherChatViewModel.message![reversedIndex].sender ==_teacherSplashViewModel.teacherUserId
                                      ? const Color.fromRGBO(96, 42, 196, 1)
                                      : const Color.fromRGBO(234, 236, 242, 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                   _teacherChatViewModel.message![reversedIndex].text!,
                                  style: TextStyle(color:  _teacherChatViewModel.message![reversedIndex].sender ==_teacherSplashViewModel.teacherUserId?Colors.white:Colors.black),
                                ),),
                );
            }
            

           
            
            ),
          ),
          SizedBox(height: 25,),
           ChatInputField(controller: _teacherChatViewModel.textController,function: (){
            _teacherChatViewModel.postMessage();
           }),
        ],
      ),
    );
  }
}


