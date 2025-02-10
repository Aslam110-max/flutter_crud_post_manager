import 'package:flutter/material.dart';
import 'package:flutter_crud_post_manager/features/home/domain/models/post_model.dart';
import 'package:flutter_crud_post_manager/helper/route_helper.dart';
import 'package:flutter_crud_post_manager/util/dimensions.dart';
import 'package:flutter_crud_post_manager/util/styles.dart';
import 'package:get/get.dart';

class DetailsCard extends StatelessWidget {
  final PostModel postModel;
  const DetailsCard({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.only(
    right: Dimensions.paddingSizeDefault,
    left: Dimensions.paddingSizeDefault,
    bottom: Dimensions.paddingSizeDefault,
  ),
  child: Container(
    height: 120,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
      color: Theme.of(context).cardColor,
    ),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: (){
          Get.toNamed(RouteHelper.getDetailsRoute(postModel));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child:  Text(
              "User Id: ${postModel.userId}",
              style: robotoRegular.copyWith(color: Colors.white),
            ),
             
            ),
            Divider(color: Theme.of(context).disabledColor,),
            Text(
              postModel.title,
              style: robotoRegular.copyWith(color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
            postModel.body,
              style: robotoRegular.copyWith(
                color: Colors.white70,
                fontSize: Dimensions.fontSizeSmall,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ),
  ),
);
  }
}
