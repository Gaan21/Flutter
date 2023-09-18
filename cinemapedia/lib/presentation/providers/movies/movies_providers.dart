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

final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final upcomingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final topRatedMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallBack fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading == true;

    print("object");

    //TODO: Sigue llamando a este print demasiadas veces y por tanto
    //carga demasiadas paginas
    currentPage++;
    print(currentPage);

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(
      const Duration(milliseconds: 800),
    );
    isLoading = false;
  }
}
