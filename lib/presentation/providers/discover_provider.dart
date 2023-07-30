import 'package:flutter/material.dart';
import 'package:tik_tok_clone/domain/entities/video_post.dart';
import 'package:tik_tok_clone/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {

    final VideoPostRepository videosRepository;

    bool initialLoading = true;
    List<VideoPost> videos = [];

    DiscoverProvider({ 
        required this.videosRepository
    });

    Future<void> loadNextPage() async {

        final newVideos = await videosRepository.getTrendingVideosByPage(1);

        videos.addAll(newVideos);
        initialLoading = false;
        notifyListeners();
    }
}
