import 'package:dio/dio.dart';
import 'package:fl_cinemapedia/config/constants/environment.dart';
import 'package:fl_cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:fl_cinemapedia/domain/entities/movie.dart';
import 'package:fl_cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:fl_cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}
