import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final slideShowMoviesSublist = ref.watch(moviesSlideshowProvider);

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    if (slideShowMoviesSublist.isEmpty) {
      return const CircularProgressIndicator();
    }

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              //const CustomAppbar(),
              MoviesSlideshow(movies: slideShowMoviesSublist),
              MovieHorizontalListview(
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
                movies: nowPlayingMovies,
                title: "En cines",
                subTitle: "Hoy",
              ),
              MovieHorizontalListview(
                loadNextPage: () {
                  ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                },
                movies: upcomingMovies,
                title: "Proximamente",
                subTitle: "Lunes 20",
              ),
              MovieHorizontalListview(
                loadNextPage: () {
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                },
                movies: topRatedMovies,
                title: "Mejor Valoradas",
                subTitle: "Lunes 20",
              ),
              MovieHorizontalListview(
                loadNextPage: () {
                  ref.read(popularMoviesProvider.notifier).loadNextPage();
                },
                movies: popularMovies,
                title: "Populares",
                subTitle: "Lunes 20",
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        }, childCount: 1),
      )
    ]);
  }
}
