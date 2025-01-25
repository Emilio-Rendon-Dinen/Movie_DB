import 'package:movie_db/src/data/endpoints/get_movies_endpoint.dart';
import 'package:movie_db/src/data/models/movie_model.dart';
import 'package:movie_db/src/data/source/remote/http_data_source.dart';
import 'package:movie_db/src/domain/entities/movie.dart';
import 'package:movie_db/src/domain/repositories/get_movies_by_index_repository.dart';

class GetMoviesByIndexImplementation implements GetMoviesByIndexRepository {
  final HttpDataSource _httpDataSource;

  const GetMoviesByIndexImplementation({required HttpDataSource httpDataSource}) : _httpDataSource = httpDataSource;

  @override
  Future<List<Movie>> getMovies(int index) async {
    try {
      var json = await _httpDataSource.execute(
        GetMoviesEndpoint(index: index),
      );
      final List<Movie> data = MovieModel.parseToList(json);
      return Future.value(data);
    } catch (e) {
      // Manejo de errores
      return Future.error('Error de http al obtener las peliculas: $e');
    }
  }
}
