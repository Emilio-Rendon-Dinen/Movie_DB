import 'package:movie_db/src/domain/entities/movie_description.dart';
import 'package:movie_db/src/domain/repositories/get_movie_description_by_id_repository.dart';

class GetMovieDescriptionByIdUseCase {
  final GetMovieDescriptionByIdRepository _getMoviesDescriptionByIdRepository;

  const GetMovieDescriptionByIdUseCase(this._getMoviesDescriptionByIdRepository);

  Future<MovieDescription> getDescription(int id) {
    try {
      return _getMoviesDescriptionByIdRepository.getDescription(id);
    } catch (e) {
      rethrow;
    }
  }
}
