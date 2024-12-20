import 'package:http/http.dart' as http;
import 'package:movie_db/src/constants/constants.dart';

/// Clase que ejecuta las peticiones HTTP
final class ApiService {
  final http.Client _client;

  // Constructor que recibe un http.Client
  // Aquí definimos que si no se recibe un client entonces se crea una instancia para usar,
  // esto sirve para no crear una nueva conexión HTTP en cada peticion.
  ApiService({
    http.Client? client,
  }) : _client = client ?? http.Client();

  /// Este método hace la petición GET
  /// Si los headers son nulos, asignamos valores por defecto
  Future<http.Response> get(String url, Map<String, String>? headers) async {
    headers ??= {
      "accept": "application/json",
      "Authorization": Constants.accessToken,
    };

    try {
      final response = await _client.get(
        Uri.parse(Constants.baseUrl + url),
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception('Error making GET request: $e');
    }
  }
}
