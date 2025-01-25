import 'package:movie_db/src/core/utils/map_extensions.dart';
import 'package:movie_db/src/domain/entities/movie_description.dart';

class MovieDescriptionModel extends MovieDescription {
  const MovieDescriptionModel({
    required super.id,
    required super.title,
    required super.description,
    required super.budget,
    required super.poster,
  });

  /// Constructor nombrado que espera un [Map] con la información de una pelicula y crea una instancia de [MovieDescription].
  MovieDescriptionModel.parse(
    Map<String, dynamic> json,
  ) : super(
          id: json.getString('id'),
          title: json.getString('title'),
          description: json.getString('overview'),
          budget: json.getString('budget'),
          poster: json.getString('poster_path'),
        );

  /// Parsea un [List] que representa la información de varias peliculas y retorna una lista de instancias de [MovieDescription].
  ///
  /// Si la data proporcionado es `null`, se devuelve una lista vacía.
  static List<MovieDescription> parseToList(dynamic json) {
    final List<MovieDescription> list = [];

    if (json is Map<String, dynamic>) {
      final dynamic data = json['results'];

      if (data == null) {
        return list;
      }

      if (data is List && data.isNotEmpty) {
        for (final element in data) {
          if (element is Map<String, dynamic>) {
            final MovieDescription item = MovieDescriptionModel.parse(element);

            list.add(item);
          }
        }
      } else if (data is Map<String, dynamic>) {
        final MovieDescription item = MovieDescriptionModel.parse(data);

        list.add(item);
      }
    }

    return list;
  }
}
