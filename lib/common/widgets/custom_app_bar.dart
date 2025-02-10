import 'package:flutter/material.dart';
import 'package:flutter_crud_post_manager/common/widgets/custom_cupertino.dart';
import 'package:flutter_crud_post_manager/features/details/controller/details_controller.dart';
import 'package:flutter_crud_post_manager/util/dimensions.dart';
import 'package:flutter_crud_post_manager/util/styles.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool backButton;
  final bool deleteButton;
  final int? id;
  const CustomAppBar(
      {super.key, this.backButton = true, this.deleteButton = false, this.id});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: RichText(
        text: TextSpan(
          style: robotoRegular.copyWith(
            fontSize: Dimensions.fontSizeLarge,
            color: const Color(0xFFFFCC30),
          ),
          children: [
            const TextSpan(text: 'Flutter '),
            TextSpan(
              text: 'CRUD',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            const TextSpan(text: ' Post Manager'),
          ],
        ),
      ),
      centerTitle: true,
      leading: backButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
            )
          : const SizedBox(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        deleteButton
            ? IconButton(
                onPressed: () {
                  showCurpertinoDialog(context, "Are you sure?",
                      "Do you want to delete current post", () async {
                    await Get.find<DetailsController>().deletePost(id!);
                    Navigator.pop(context);
                  });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
            : const SizedBox()
      ],
    );
  }

  @override
  Size get preferredSize => Size(Get.width, GetPlatform.isDesktop ? 100 : 50);
}
