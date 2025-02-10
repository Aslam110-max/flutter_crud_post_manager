import 'package:flutter_crud_post_manager/api/api_client.dart';
import 'package:flutter_crud_post_manager/features/home/domain/models/post_model.dart';
import 'package:flutter_crud_post_manager/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'details_repository_interface.dart';

class DetailsRepository implements DetailsRepositoryInterface {
  final ApiClient apiClient;

  DetailsRepository({required this.apiClient});

  @override
  Future<PostModel?> addPost(PostModel post) async {
    Response response = await apiClient.postData(
      AppConstants.getDataUri,
      {
        "title": post.title,
        "body": post.body,
        "userId": post.userId,
      },
    );
    if (response.statusCode == 201) {
      return PostModel.fromJson(response.body);
    }
    return null;
  }

  @override
  Future<PostModel?> updatePost(int id, PostModel post) async {
    Response response = await apiClient.putData(
      '${AppConstants.getDataUri}/$id',
      post.toJson(),
    );
    if (response.statusCode == 200) {
      return PostModel.fromJson(response.body);
    }
    return null;
  }

  @override
  Future<bool> deletePost(int id) async {
    Response response =
        await apiClient.deleteData('${AppConstants.getDataUri}/$id');
    return response.statusCode == 200;
  }
}
