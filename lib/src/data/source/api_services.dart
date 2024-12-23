import 'package:http/http.dart';
import 'package:movie_db/src/core/constants/constants.dart';
import 'package:movie_db/src/data/source/api_validator.dart';

/// Clase que ejecuta las peticiones HTTP
final class ApiService {
  final Client _client;

  // Constructor que recibe un http.Client
  // Aquí definimos que si no se recibe un client entonces se crea una instancia para usar,
  // esto sirve para no crear una nueva conexión HTTP en cada peticion.
  ApiService({
    Client? client,
  }) : _client = client ?? Client();

  /// Este método hace la petición GET
  /// Si los headers son nulos, asignamos valores por defecto
  Future<dynamic> get(String url, Map<String, String>? headers) async {
    headers ??= {
      "accept": "application/json",
      "Authorization": Constants.accessToken,
    };

    try {
      // Obtienes la respuesta completa de la API
      final response = await _client.get(
        Uri.parse(Constants.baseUrl + url),
        headers: headers,
      );

      ///Retorna ya sea un Map<String, dynamic> o un error
      return ApiValidator.validateResponse(response);
    } catch (e) {
      throw Exception('Error making GET request: $e');
    }
  }
}
