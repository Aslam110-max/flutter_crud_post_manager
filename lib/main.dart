import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_crud_post_manager/api/api_client.dart';
import 'package:flutter_crud_post_manager/features/details/controller/details_controller.dart';
import 'package:flutter_crud_post_manager/features/details/domain/repositories/details_repository.dart';
import 'package:flutter_crud_post_manager/features/details/domain/repositories/details_repository_interface.dart';
import 'package:flutter_crud_post_manager/features/home/controller/home_controller.dart';
import 'package:flutter_crud_post_manager/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_crud_post_manager/features/home/domain/repositories/home_repository_interface.dart';
import 'package:flutter_crud_post_manager/helper/route_helper.dart';
import 'package:flutter_crud_post_manager/theme/theme.dart';
import 'package:flutter_crud_post_manager/util/app_constants.dart';
import 'package:get/get.dart';

Future<void> main() async {
  runApp(const MyApp());

  ApiClient apiClient = ApiClient(appBaseUrl: AppConstants.baseUrl);
  HomeRepositoryInterface homeRepositoryInterface =
      HomeRepository(apiClient: apiClient);
  Get.put(HomeController(homeRepositoryInterface: homeRepositoryInterface));

  DetailsRepositoryInterface detailsRepositoryInterface =
      DetailsRepository(apiClient: apiClient);
  Get.put(DetailsController(
      detailsRepositoryInterface: detailsRepositoryInterface));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),
      theme: theme(),
      initialRoute: RouteHelper.getInitialRoute(),
      getPages: RouteHelper.routes,
      defaultTransition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
