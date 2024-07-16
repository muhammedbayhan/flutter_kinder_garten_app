import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kindergartenapp/feature/parent/chat/model/parent_message_model.dart';
import 'package:kindergartenapp/feature/parent/chat/viewmodel/parent_chat_viewmodel.dart';
import 'package:kindergartenapp/feature/parent/parentChildren/viewmodel/parent_children_view_model.dart';
import 'package:kindergartenapp/product/widgets/chatWidgets/chat_input.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ParentChatDetail extends StatefulWidget {
   const ParentChatDetail({super.key});

  @override
  State<ParentChatDetail> createState() => _ParentChatDetailState();
}

class _ParentChatDetailState extends State<ParentChatDetail> {
     
        final ParentChatViewModel _parentChatViewModel =
      Get.put(ParentChatViewModel());


    @override
  void initState() {
    _subscribe();
    _parentChatViewModel.getMessage();
    
    
    super.initState();
  }

  @override
  void dispose() {
        _unsubscribe();
           _parentChatViewModel.getConversations();

    _channel.sink.close();
    super.dispose();
  }

  void _subscribe() {
    _channel.sink.add(
        '{"event":"pusher:subscribe","data":{"auth":"","channel":"${_parentChatViewModel.channelId}"}}');
  }

  void _unsubscribe() {
    _channel.sink.add(
        '{"event":"pusher:unsubscribe","data":{"auth":"","channel":"${_parentChatViewModel.channelId}"}}');
  }

List<Map<String, dynamic>> messages = [];

  final _channel = WebSocketChannel.connect(
    Uri.parse(
        'wss://ws-eu.pusher.com/app/1fa5c190fd5ae5085ba8?protocol=7&client=js&version=8.2.0&flash=false'),
  );

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: DetailAppBar(title: _parentChatViewModel.teacherName!),
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
        
return _MessageField(messages: _parentChatViewModel.message);
      } else if (jsonData['event'] == 'new-message') {
        // Extract the message text and sender information from the data
        var messageData = jsonDecode(jsonData['data'])['message'];
        var messageText = messageData['text'];
        var sender = messageData['sender'];

        // Determine the alignment based on the sender

        // Update the UI with the message text and alignment
        //messages.add({'text': messageText, 'sender': isCurrentUser});
        _parentChatViewModel.message!.add(ParentMessageModel(conversation: "",id: "",text: messageText,sender: sender,receiver: "",sendAt: "",type: ""));


return _MessageField(messages: _parentChatViewModel.message);
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
    final ParentChildrenViewModel _parentChildrenViewModel =
      Get.put(ParentChildrenViewModel());

          final ParentChatViewModel _parentChatViewModel =
      Get.put(ParentChatViewModel());

  final RxList<ParentMessageModel>? messages;
  final box = GetStorage();

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
                  alignment: _parentChatViewModel.message![reversedIndex].sender ==box.read("userId")?AlignmentDirectional.topEnd:AlignmentDirectional.topStart,
                  child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: _parentChatViewModel.message![reversedIndex].sender ==box.read("userId")
                                      ? const Color.fromRGBO(96, 42, 196, 1)
                                      : const Color.fromRGBO(234, 236, 242, 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                   _parentChatViewModel.message![reversedIndex].text!,
                                  style: TextStyle(color:  _parentChatViewModel.message![reversedIndex].sender ==box.read("userId")?Colors.white:Colors.black),
                                ),),
                );
            }
            

           
            
            ),
          ),
          SizedBox(height: 25,),
           ChatInputField(controller: _parentChatViewModel.textController,function: (){
            _parentChatViewModel.postMessage();
          
           }),
        ],
      ),
    );
  }
}


