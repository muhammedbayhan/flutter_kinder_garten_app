import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/teacher/chat/service/teacher_chat_service.dart';
import 'package:kindergartenapp/feature/teacher/chat/view/teacher_chat_detail_view.dart';
import 'package:kindergartenapp/feature/teacher/chat/viewmodel/teacher_chat_viewmodel.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/chatWidgets/user_chat_card.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class TeacherChatView extends StatefulWidget {
  const TeacherChatView({super.key});

  @override
  State<TeacherChatView> createState() => _TeacherChatViewState();
}

class _TeacherChatViewState extends State<TeacherChatView> {
  @override
  void initState() {
    print("object");
_teacherChatViewModel.getConversations();
    super.initState();
  }
  final TeacherChatViewModel _teacherChatViewModel =
      Get.put(TeacherChatViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: 
      
      FloatingActionButton(
      heroTag: "chat",
        onPressed: () {
          _teacherChatViewModel.message!.clear();
          Get.to(()=>const _GetParent());
          
        },
        backgroundColor: ColorsP.primary,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: SizesP.detailPagePadding,
            child: Text(
              "Mesajlar",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _teacherChatViewModel.conversations!.length,
                itemBuilder: (context, index){ 
                final reversedIndex = _teacherChatViewModel.conversations!.length - 1 - index; // Ters sıralama için indeksi hesapla

                  
                return  InkWell(


                  child: UserChatCard(
                    svgUrl: "assets/svg/family.svg",
                    name:
                        "${_teacherChatViewModel.conversations![reversedIndex].users![1].name}",
                        lastMessage: "Son Mesaj",//8"${_teacherChatViewModel.conversations![index].messages![1].sendAt}" ,
                        time: "10:30",
                        messageCount: "",
                  ),
                  onTap: () {
                    _teacherChatViewModel.parentName = _teacherChatViewModel
                        .conversations![reversedIndex].users![1].name;
                    _teacherChatViewModel.parentPhone = _teacherChatViewModel
                        .conversations![reversedIndex].users![1].phone;
                    _teacherChatViewModel.parentId = _teacherChatViewModel
                        .conversations![reversedIndex].users![1].id;
                         _teacherChatViewModel.channelId = _teacherChatViewModel
                        .conversations![reversedIndex].channel;

                    Get.to(() => TeacherChatDetail());
                  },
                );
                }
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}


class _GetParent extends StatefulWidget {
  const _GetParent({super.key});

  @override
  State<_GetParent> createState() => _GetParentState();
}

class _GetParentState extends State<_GetParent> {
  @override
  void initState() {
    
    _teacherChatViewModel.getParents();
    super.initState();
  }

  @override
  void dispose() {
           _teacherChatViewModel.getConversations();
    super.dispose();
  }
    final TeacherChatViewModel _teacherChatViewModel =
      Get.put(TeacherChatViewModel());
     
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const DetailAppBar(title: "Yeni Sohbet"),
      body: Obx(
                    () => ListView.builder(
                      
                      itemCount: _teacherChatViewModel.parents!.length,
                      itemBuilder: (context, index) => InkWell(
                        child: UserChatCard(
                          svgUrl: "assets/svg/family.svg",
                          lastMessage: "",
                           time: "",
                           messageCount: "",
      
                          name:
                              "${_teacherChatViewModel.parents![index].user!.name}",
                        ),
                        onTap: () {
                          _teacherChatViewModel.parentName =
                              _teacherChatViewModel.parents![index].user!.name;
                          _teacherChatViewModel.parentPhone =
                              _teacherChatViewModel.parents![index].user!.phone;
                          _teacherChatViewModel.parentId =
                              _teacherChatViewModel.parents![index].user!.sId;
                                   _teacherChatViewModel.message!.clear();
                                   

        Get.to(TeacherChatDetail());
                        },
                      ),
                    ),
                  ),
    );
  }
}