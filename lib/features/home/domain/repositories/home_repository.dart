import 'package:flutter_crud_post_manager/api/api_client.dart';
import 'package:flutter_crud_post_manager/features/home/domain/models/post_model.dart';
import 'package:flutter_crud_post_manager/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'home_repository_interface.dart';

class HomeRepository implements HomeRepositoryInterface {
  final ApiClient apiClient;

  HomeRepository({required this.apiClient});


  @override
  Future<List<PostModel>?> getData() async {
  List<PostModel>? posts;
  Response response = await apiClient.getData(AppConstants.getDataUri);
  if (response.statusCode == 200) {
    final List<dynamic> jsonData = response.body;
    posts = jsonData.map((item) => PostModel.fromJson(item)).toList();
  }
  
  return posts;
}


}
