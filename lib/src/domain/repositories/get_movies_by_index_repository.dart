import 'package:movie_db/src/domain/entities/movie.dart';

abstract class GetMoviesByIndexRepository {
  Future<List<Movie>> getMovies(int id);
}
