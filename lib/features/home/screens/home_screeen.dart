import 'package:flutter/material.dart';
import 'package:flutter_crud_post_manager/common/widgets/custom_app_bar.dart';
import 'package:flutter_crud_post_manager/features/home/controller/home_controller.dart';
import 'package:flutter_crud_post_manager/features/home/widgets/details_card.dart';
import 'package:flutter_crud_post_manager/helper/route_helper.dart';
import 'package:flutter_crud_post_manager/util/dimensions.dart';
import 'package:flutter_crud_post_manager/util/styles.dart';
import 'package:get/get.dart';

class HomeScreeen extends StatefulWidget {
  const HomeScreeen({super.key});

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  @override
  void initState() {
    Get.find<HomeController>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(RouteHelper.getDetailsRoute(null));
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
        appBar: const CustomAppBar(
          backButton: false,
        ),
        body: GetBuilder<HomeController>(builder: (homeController) {
          return homeController.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : homeController.posts == null
                  ? Center(
                      child: Text(
                        "No data available!",
                        style: robotoRegular.copyWith(color: Colors.white60),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            itemCount: homeController.posts!.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              top: Dimensions.paddingSizeExtraSmall,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return DetailsCard(
                                postModel: homeController.posts![index],
                              );
                            },
                          ),
                        ],
                      ),
                    );
        }));
  }
}
