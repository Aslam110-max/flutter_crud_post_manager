import 'package:flutter_crud_post_manager/common/widgets/custom_snackbar.dart';
import 'package:flutter_crud_post_manager/features/details/domain/repositories/details_repository_interface.dart';
import 'package:flutter_crud_post_manager/features/home/controller/home_controller.dart';
import 'package:flutter_crud_post_manager/features/home/domain/models/post_model.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController implements GetxService {
  final DetailsRepositoryInterface detailsRepositoryInterface;
  final HomeController homeController = Get.find<HomeController>();

  DetailsController({required this.detailsRepositoryInterface});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> addPost(PostModel post) async {
    _isLoading = true;
    update();
    PostModel? newPost = await detailsRepositoryInterface.addPost(post);
    if (newPost != null) {
      homeController.addPostToList(newPost);
      showCustomSnackBar("New post added!",isError: false);
    }else{
       showCustomSnackBar("Please try again!");
    }
    _isLoading = false;
    update();
  }

  Future<void> updatePost(int id, PostModel updatedPost) async {
    _isLoading = true;
    update();
    PostModel? post =
        await detailsRepositoryInterface.updatePost(id, updatedPost);
    if (post != null) {
      homeController.updatePostInList(id, post);
      showCustomSnackBar("Post updated!",isError: false);
    }else{
       showCustomSnackBar("Please try again!");
    }
    _isLoading = false;
    update();
  }

  Future<void> deletePost(int id) async {
    _isLoading = true;
    update();
    bool isDeleted = await detailsRepositoryInterface.deletePost(id);
    if (isDeleted) {
      showCustomSnackBar("Current post deleted!",isError: false);
      homeController.removePostFromList(id);
    }else{
       showCustomSnackBar("Please try again!");
    }
    _isLoading = false;
    update();
  }
}
