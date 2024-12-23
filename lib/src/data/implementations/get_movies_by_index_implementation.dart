import 'package:movie_db/src/data/models/movie_model.dart';
import 'package:movie_db/src/data/source/api_services.dart';
import 'package:movie_db/src/domain/entities/movie.dart';
import 'package:movie_db/src/domain/repositories/get_movies_by_index_repository.dart';

class GetMoviesByIndexImplementation implements GetMoviesByIndexRepository {
  final ApiService _apiService;

  const GetMoviesByIndexImplementation({required ApiService apiServices}) : _apiService = apiServices;

  @override
  Future<List<Movie>> getMovies(int id) async {
    try {
      var json = await _apiService.get('$id', null);
      // Ahora puedes parsear la lista de películas
      final List<Movie> data = MovieModel.parseToList(json);
      return Future.value(data);
    } catch (e) {
      // Manejo de errores
      return Future.error('Error de http al obtener las peliculas: $e');
    }
  }
}
