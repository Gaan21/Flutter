import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastucture/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastucture/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource implements MoviesDataSource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": Environment.theMovieDbKey,
        "language": "es",
      },
    ),
  );

  List<Movie> _jsonToMovie(Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
        //Si viene sin poster la película no se muestra
        .where((movieDB) => movieDB.posterPath != "no-poster")
        .map((movieDB) => MovieMapper.movieDBToEntity(movieDB))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      "/movie/now_playing",
      queryParameters: {
        "page": page,
      },
    );

    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      "/movie/popular",
      queryParameters: {
        "page": page,
      },
    );
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      "/movie/top_rated",
      queryParameters: {
        "page": page,
      },
    );
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      "/movie/upcoming",
      queryParameters: {
        "page": page,
      },
    );
    return _jsonToMovie(response.data);
  }
}
