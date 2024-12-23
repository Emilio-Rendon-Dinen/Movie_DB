import 'package:movie_db/src/domain/entities/movie.dart';
import 'package:movie_db/src/domain/repositories/get_movies_by_index_repository.dart';

class GetMoviesByIndexUseCase {
  final GetMoviesByIndexRepository _getMoviesByIndexRepository;

  const GetMoviesByIndexUseCase(this._getMoviesByIndexRepository);

  Future<List<Movie>> getMovies(int index) {
    try {
      return _getMoviesByIndexRepository.getMovies(index);
    } catch (e) {
      rethrow;
    }
  }
}
