import 'package:flutter/material.dart';
import 'package:tik_tok_clone/config/theme/app_theme.dart';
import 'package:tik_tok_clone/infrastructure/datasources/local_video_datasources_impl.dart';
import 'package:tik_tok_clone/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tik_tok_clone/presentation/providers/discover_provider.dart';
import 'package:tik_tok_clone/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {

        final videoPostsRepository = VideoPostsRepositoryImpl(videosDatasource: LocalVideoDatasource());

        return MultiProvider(
        providers: [
            ChangeNotifierProvider(
            lazy: false,
            create: (_) => DiscoverProvider(videosRepository: videoPostsRepository)..loadNextPage(),
            )
        ],
        child: MaterialApp(
            title: 'TikTok',
            debugShowCheckedModeBanner: false,
            theme: AppTheme().getTheme(),
            home: const DiscoverScreen(),
        ),
        );
    }
}
