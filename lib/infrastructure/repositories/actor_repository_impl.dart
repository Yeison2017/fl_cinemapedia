import 'package:fl_cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:fl_cinemapedia/domain/entities/actor.dart';
import 'package:fl_cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;
  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
