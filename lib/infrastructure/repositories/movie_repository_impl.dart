import 'package:fl_cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:fl_cinemapedia/domain/entities/movie.dart';
import 'package:fl_cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource dataSource;
  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }
}
