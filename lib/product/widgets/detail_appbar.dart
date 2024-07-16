import 'package:flutter/material.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailAppBar({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final String title;
  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left,
          size: SizesP.mediumIcon,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold)),
      centerTitle: true,
    );
  }
}
