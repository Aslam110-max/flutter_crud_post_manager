

import 'package:flutter_crud_post_manager/features/home/domain/models/post_model.dart';

abstract class DetailsRepositoryInterface<T> {
  Future<PostModel?> addPost(PostModel post);
  Future<PostModel?> updatePost(int id, PostModel post);
    Future<bool> deletePost(int id);
  
}
