// import 'package:movie_db/src/data/models/movie_description.dart';
// import 'package:movie_db/src/data/source/api_services.dart';
// import 'package:movie_db/src/domain/entities/movie_description.dart';
// import 'package:movie_db/src/domain/repositories/get_movie_description_by_id_repository.dart';

// class GetMovieDescriptionByIdImplementation implements GetMovieDescriptionByIdRepository {
//   final ApiService _apiService;

//   const GetMovieDescriptionByIdImplementation({required ApiService apiServices}) : _apiService = apiServices;

//   @override
//   Future<MovieDescription> getDescription(int id) async {
//     try {
//       var json = await _apiService.get('$id', null);
//       final MovieDescription data = MovieDescriptionModel.parse(json);
//       return Future.value(data);
//     } catch (e) {
//       // Manejo de errores
//       return Future.error('Error de http al obtener las peliculas: $e');
//     }
//   }
// }
