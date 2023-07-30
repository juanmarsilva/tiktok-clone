import 'package:tik_tok_clone/domain/datasources/video_posts_datasource.dart';
import 'package:tik_tok_clone/domain/entities/video_post.dart';
import 'package:tik_tok_clone/infrastructure/models/local_video_model.dart';
import 'package:tik_tok_clone/shared/data/local_video_posts.dart';

class LocalVideoDatasource implements VideoPostDatasource {
    @override
    Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
        throw UnimplementedError();
    }

    @override
    Future<List<VideoPost>> getTrendingVideosByPage(int page) async {

        await Future.delayed(const Duration(seconds: 2));

        final List<VideoPost> newVideos = 
            videoPosts.map(
                (video) => 
                    LocalVideoModel
                        .fromJson(video)
                        .toVideoPostEntity()
            )
            .toList(); // for convert from Iterable<VideoPost> to List<VideoPost>
    
        return newVideos;
    }

}