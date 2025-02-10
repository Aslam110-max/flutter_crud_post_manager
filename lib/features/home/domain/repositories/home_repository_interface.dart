

import 'package:flutter_crud_post_manager/features/home/domain/models/post_model.dart';

abstract class HomeRepositoryInterface<T> {
  Future<List<PostModel>?> getData();
  
}
