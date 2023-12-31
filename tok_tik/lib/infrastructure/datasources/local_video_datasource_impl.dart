import 'package:tok_tik/domain/dataSources/video_post_datasource.dart';
import 'package:tok_tik/domain/entities/video_post.dart';

import '../../shared/data/local_video_posts.dart';
import '../models/local_video_model.dart';

class LocalVideoDataSource implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}
