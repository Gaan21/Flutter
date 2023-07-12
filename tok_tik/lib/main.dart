import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik/config/theme/app_theme.dart';
import 'package:tok_tik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tok_tik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tok_tik/presentation/providers/discover_provider.dart';
import 'package:tok_tik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videosDataSource: LocalVideoDataSource());

    /* final videoPostDatasource =
        VideoPostsRepositoryImpl(videosDataSource: localVideoDataSource()); */

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            //lazy: false,
            create: (context) =>
                DiscoverProvider(videosRepository: videoPostRepository)
                  ..loadNextPage())
      ],
      child: MaterialApp(
        title: "TokTik",
        debugShowCheckedModeBanner: false,
        home: const DiscoverScreen(),
        theme: AppTheme().getTheme(),
      ),
    );
  }
}
