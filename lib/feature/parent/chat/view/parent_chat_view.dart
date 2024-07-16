import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/chat/view/parent_chat_detail_view.dart';
import 'package:kindergartenapp/feature/parent/chat/viewmodel/parent_chat_viewmodel.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/chatWidgets/user_chat_card.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';

class ParentChatView extends StatefulWidget {
  const ParentChatView({super.key});

  @override
  State<ParentChatView> createState() => _ParentChatViewState();
}

class _ParentChatViewState extends State<ParentChatView> {
  @override
  void initState() {
    print("object");
_parentChatViewModel.getConversations();
    super.initState();
  }
  final ParentChatViewModel _parentChatViewModel =
      Get.put(ParentChatViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _parentChatViewModel.message!.clear();
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
                itemCount: _parentChatViewModel.conversations!.length,
                itemBuilder: (context, index){ 
                final reversedIndex = _parentChatViewModel.conversations!.length - 1 - index; // Ters sıralama için indeksi hesapla

                  
                return  InkWell(


                  child: UserChatCard(
                    svgUrl: "assets/svg/teacherDefault.svg",
                    name:
                        "${_parentChatViewModel.conversations![reversedIndex].users![0].name}",
                        lastMessage: "Son Mesaj",//8"${_teacherChatViewModel.conversations![index].messages![1].sendAt}" ,
                        time: "16:00",
                        messageCount: "",
                  ),
                  onTap: () {
                    _parentChatViewModel.teacherName = _parentChatViewModel
                        .conversations![reversedIndex].users![0].name;
                    _parentChatViewModel.teacherPhone = _parentChatViewModel
                        .conversations![reversedIndex].users![0].phone;
                    _parentChatViewModel.teacherId = _parentChatViewModel
                        .conversations![reversedIndex].users![0].id;
                         _parentChatViewModel.channelId = _parentChatViewModel
                        .conversations![reversedIndex].channel;

                    Get.to(() => ParentChatDetail());
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
    
    _parentChatViewModel.getTeachers();
    super.initState();
  }

  @override
  void dispose() {
           _parentChatViewModel.getConversations();
    super.dispose();
  }
    final ParentChatViewModel _parentChatViewModel =
      Get.put(ParentChatViewModel());
     
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const DetailAppBar(title: "Yeni Sohbet"),
      body: Obx(
                    () => ListView.builder(
                      
                      itemCount: _parentChatViewModel.teachers!.length,
                      itemBuilder: (context, index) => InkWell(
                        child: UserChatCard(
                    svgUrl: "assets/svg/teacherDefault.svg",
                          lastMessage: "",
                           time: "",
                           messageCount: "",
      
                          name:
                              "${_parentChatViewModel.teachers![index].user!.name}",
                        ),
                        onTap: () {
                          _parentChatViewModel.teacherName =
                              _parentChatViewModel.teachers![index].user!.name;
                          _parentChatViewModel.teacherPhone =
                              _parentChatViewModel.teachers![index].user!.phone;
                          _parentChatViewModel.teacherId =
                              _parentChatViewModel.teachers![index].user!.id;
                                   _parentChatViewModel.message!.clear();
                                   

        Get.to(ParentChatDetail());
                        },
                      ),
                    ),
                  ),
    );
  }
}