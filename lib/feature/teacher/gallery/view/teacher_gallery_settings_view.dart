import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kindergartenapp/feature/teacher/gallery/viewmodel/teacher_gallery_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';

class TeacherGallerySettingsView extends StatefulWidget {
  const TeacherGallerySettingsView({super.key});

  @override
  State<TeacherGallerySettingsView> createState() =>
      _TeacherGallerySettingsViewState();
}

class _TeacherGallerySettingsViewState
    extends State<TeacherGallerySettingsView> {
  final TeacherGalleryViewModel _teacherGalleryViewModel =
      Get.put(TeacherGalleryViewModel());

  @override
  void initState() {
    _teacherGalleryViewModel.getGallery();
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  _getFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print(pickedFile.path);
        _teacherGalleryViewModel.postImage(imageFile!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _getFromGallery();
          },
          child: Icon(Icons.add),
          backgroundColor: ColorsP.primary),
      appBar: AppBar(),
      body: Padding(
        padding: SizesP.detailPagePadding,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Galeri",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Obx(
            () => Expanded(
              child: GridView.builder(
                itemCount: _teacherGalleryViewModel.gallery!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context,index)=>
         Card(
  child: Stack(
    fit: StackFit.expand,
    alignment: Alignment.bottomCenter,
    children: [
      Image.network(
        _teacherGalleryViewModel.gallery![index].url!,
        fit: BoxFit.cover,
      ),
      Positioned(
        bottom: 5,
        right: 5,
        
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {
              _teacherGalleryViewModel.deleteImage(_teacherGalleryViewModel.gallery![index].id!);
            },
            icon: Icon(Icons.delete, color: ColorsP.primary),
          ),
        ),
      ),
    ],
  ),
)
              )
            ),
          ),
        ]),
      ),
    );
  }
}


// Card(
//                       child: Container(
//                         child: Stack(
//                           alignment: Alignment.bottomCenter,
//                           children: [
//                           Image.network(
//                           _teacherGalleryViewModel.gallery![index].url!,
//                           fit: BoxFit.cover,
//                         ),
//                         CircleAvatar(
//                         backgroundColor: Colors.white,
//                         child: IconButton(onPressed: (){
//                           _teacherGalleryViewModel.deleteImage(_teacherGalleryViewModel.gallery![index].id!);
//                         }, icon: Icon(Icons.delete,color: ColorsP.primary,))) ,
//                         ],)
//                       ),
//                     );