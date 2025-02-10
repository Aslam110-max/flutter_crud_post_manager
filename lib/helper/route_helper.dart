import 'dart:convert';

import 'package:flutter_crud_post_manager/features/details/screens/details_screen.dart';
import 'package:flutter_crud_post_manager/features/home/domain/models/post_model.dart';
import 'package:flutter_crud_post_manager/features/home/screens/home_screeen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String details = '/details';

  static String getInitialRoute() => initial;

static String getDetailsRoute(PostModel? postModel) {
  if (postModel == null) return details;
  String encodedData = Uri.encodeComponent(jsonEncode(postModel.toJson()));
  return '$details?postData=$encodedData';
}


  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const HomeScreeen()),
    GetPage(name: details, page: () => DetailsScreen(post:Get.parameters['postData']!=null? PostModel.fromJson(jsonDecode(Get.parameters['postData']!)):null,)),
  ];
}
