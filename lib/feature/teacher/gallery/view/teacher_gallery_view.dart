import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kindergartenapp/feature/teacher/gallery/viewmodel/teacher_gallery_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';

class TeacherGalleryView extends StatefulWidget {
  const TeacherGalleryView({super.key});

  @override
  State<TeacherGalleryView> createState() => _TeacherGalleryViewState();
}

class _TeacherGalleryViewState extends State<TeacherGalleryView> {
  final TeacherGalleryViewModel _teacherGalleryViewModel =
      Get.put(TeacherGalleryViewModel());

  @override
  void initState() {
    _teacherGalleryViewModel.getGallery();
    super.initState();
  }
final ImagePicker _picker=ImagePicker();
File? imageFile;

_getFromGallery()async{
  XFile? pickedFile=await _picker.pickImage(source: ImageSource.gallery);
  if (pickedFile!=null) {
    setState(() {
      imageFile=File(pickedFile.path);
      print(pickedFile.path);
      _teacherGalleryViewModel.postImage(imageFile!);
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "gallery",
        onPressed: (){
_getFromGallery();



      },child: Icon(Icons.add),backgroundColor: ColorsP.primary),
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
              child: GridView.custom(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(2, 3),
                    QuiltedGridTile(2, 1),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: _teacherGalleryViewModel.gallery!.length,
                  (context, index) => InkWell(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(SizesP.itemRadius),
                          child: Container(
                            child: Image.network(
                              _teacherGalleryViewModel.gallery![index].url!,
                              fit: BoxFit.cover,
                            ),
                            color: ColorsP.white,
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(onPressed: (){
                              _teacherGalleryViewModel.deleteImage(_teacherGalleryViewModel.gallery![index].id!);
                            }, icon: Icon(Icons.delete,color: ColorsP.primary,)))
                        )
                      ],
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              child: Image.network(
                                _teacherGalleryViewModel.gallery![index].url!,
                                fit: BoxFit.cover,
                              ),
                            );
                          });
                    },
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
