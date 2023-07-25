import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    //StateNotifierProvider <Clase que controla, <datos que recoge>>
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  //La referencia a la función que se ejecutara en la clase MoviesNotifier
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  //TODO: Me pierdo en este punto

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallBack fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
