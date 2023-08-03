import 'package:cinemapedia/infrastucture/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastucture/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
  //TODO: Por recibir un MoviedbDatasource sabe que tiene que
  // llamar al método del datasource de moviedbDatasource?
});
