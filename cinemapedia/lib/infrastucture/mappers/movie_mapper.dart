import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastucture/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastucture/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieFromMovieDB movieFromBD) {
    return Movie(
      adult: movieFromBD.adult,
      backdropPath: (movieFromBD.backdropPath != ""
          ? "https://image.tmdb.org/t/p/w500${movieFromBD.backdropPath}"
          : "https://cdn.vectorstock.com/i/1000x1000/15/03/14151503.jpg"),
      genreIds: movieFromBD.genreIds.map((e) => e.toString()).toList(),
      id: movieFromBD.id,
      originalLanguage: movieFromBD.originalLanguage,
      originalTitle: movieFromBD.originalTitle,
      overview: movieFromBD.overview,
      popularity: movieFromBD.popularity,
      posterPath: (movieFromBD.posterPath != "")
          ? "https://image.tmdb.org/t/p/w500${movieFromBD.posterPath}"
          : "no-poster",
      releaseDate: movieFromBD.releaseDate,
      title: movieFromBD.title,
      video: movieFromBD.video,
      voteAverage: movieFromBD.voteAverage,
      voteCount: movieFromBD.voteCount,
    );
  }

  static Movie movieDetailsToEntity(MovieDetails movieFromBD) {
    return Movie(
      adult: movieFromBD.adult,
      backdropPath: (movieFromBD.backdropPath != ""
          ? "https://image.tmdb.org/t/p/w500${movieFromBD.backdropPath}"
          : "https://cdn.vectorstock.com/i/1000x1000/15/03/14151503.jpg"),
      genreIds: movieFromBD.genres.map((e) => e.name).toList(),
      id: movieFromBD.id,
      originalLanguage: movieFromBD.originalLanguage,
      originalTitle: movieFromBD.originalTitle,
      overview: movieFromBD.overview,
      popularity: movieFromBD.popularity,
      posterPath: (movieFromBD.posterPath != "")
          ? "https://image.tmdb.org/t/p/w500${movieFromBD.posterPath}"
          : "no-poster",
      releaseDate: movieFromBD.releaseDate,
      title: movieFromBD.title,
      video: movieFromBD.video,
      voteAverage: movieFromBD.voteAverage,
      voteCount: movieFromBD.voteCount,
    );
  }
}
