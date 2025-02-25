import 'package:flutter_crud_post_manager/features/home/domain/models/post_model.dart';
import 'package:flutter_crud_post_manager/features/home/domain/repositories/home_repository_interface.dart';
import 'package:get/get.dart';

class HomeController extends GetxController implements GetxService {
  final HomeRepositoryInterface homeRepositoryInterface;
  HomeController({required this.homeRepositoryInterface});

  List<PostModel>? _posts;
  List<PostModel>? get posts => _posts;

  List<PostModel>? _filteredPosts;
  List<PostModel>? get filteredPosts => _filteredPosts;


  String? _searchText;
  String? get searchText => _searchText;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setSearchText(String text){
    _searchText=text;
    _filteredPosts= _posts!.where((post)=> post.title.toLowerCase().contains(text.toLowerCase())).toList();
    update();
    
  }

  
   void updatePosts(List<PostModel> newPosts) {
    _posts = newPosts;
    update();
  }

  void addPostToList(PostModel post) {
    _posts?.add(post);
    update();
  }


  void updatePostInList(int id, PostModel updatedPost) {
    int index = _posts?.indexWhere((p) => p.id == id) ?? -1;
    if (index != -1) {
      _posts?[index] = updatedPost;
    }
    update();
  }


  void removePostFromList(int id) {
    _posts?.removeWhere((p) => p.id == id);
    update();
  }

  Future<void> getData() async {
    _isLoading=true;
    update();
    _posts = null;
    _posts = await homeRepositoryInterface.getData();
    _filteredPosts=_posts;
    _isLoading=false;
    update();
  }
}
