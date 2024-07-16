import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/gallery/viewmodel/gallery_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
    final GalleryViewModel _galleryViewModel = Get.put(GalleryViewModel());

  @override
  void initState() {
_galleryViewModel.getGallery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ()=> Expanded(
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
                    childCount: _galleryViewModel.gallery!.length,
                    (context, index) => 
                         
                            InkWell(
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(SizesP.itemRadius),
                                child: Container(
                                  child:Image.network(
                                    _galleryViewModel.gallery![index].url!,fit: BoxFit.cover,
                                  ),
                                  color: ColorsP.white,
                                ),
                              ),
                              onTap: () {
                                              showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(child: Image.network(
                                    _galleryViewModel.gallery![index].url!,fit: BoxFit.cover,
                                  ),);
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
