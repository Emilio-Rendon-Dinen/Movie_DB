import 'package:movie_db/src/domain/entities/movie_description.dart';

abstract class GetMovieDescriptionByIdRepository {
  Future<MovieDescription> getDescription(int id);
}
