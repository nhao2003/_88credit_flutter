import 'package:_88credit_flutter/features/domain/entities/credit/post.dart';
import '../../../../core/resources/data_state.dart';

abstract class PostRepository {
  // API remote
  Future<DataState<List<PostEntity>>> getPosts(String? idUser);
  Future<DataState<PostEntity>> getSinglePost(String id);
  Future<DataState<void>> createPost(PostEntity post);
  Future<DataState<void>> updatePost(PostEntity post);
  Future<DataState<void>> deletePost(String id);

  // management
  Future<DataState<List<PostEntity>>> getPostsApproved();
  Future<DataState<List<PostEntity>>> getPostsHided();
  Future<DataState<List<PostEntity>>> getPostsPending();
  Future<DataState<List<PostEntity>>> getPostsRejected();
}
