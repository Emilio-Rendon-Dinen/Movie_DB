import 'package:movie_db/src/data/endpoints/get_movie_description_endpoint.dart';
import 'package:movie_db/src/data/models/movie_description.dart';
import 'package:movie_db/src/data/source/remote/http_data_source.dart';
import 'package:movie_db/src/domain/entities/movie_description.dart';
import 'package:movie_db/src/domain/repositories/get_movie_description_by_id_repository.dart';

class GetMovieDescriptionByIdImplementation implements GetMovieDescriptionByIdRepository {
  final HttpDataSource _httpDataSource;

  const GetMovieDescriptionByIdImplementation({required HttpDataSource httpDataSource}) : _httpDataSource = httpDataSource;

  @override
  Future<MovieDescription> getDescription(int id) async {
    try {
      var json = await _httpDataSource.execute(GetMovieDescriptionEndpoint(id: id));
      final MovieDescription data = MovieDescriptionModel.parse(json);
      return Future.value(data);
    } catch (e) {
      // Manejo de errores
      return Future.error('Error de http al obtener las peliculas: $e');
    }
  }
}
