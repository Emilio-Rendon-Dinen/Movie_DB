import 'package:movie_db/src/data/source/remote/http_request_type.dart';

/// Clase para configurar los end points de las peticiones http
class HttpEndpoint {
  /// Segmento final de la url a ejecutar
  final String path;

  /// "Cuerpo" de la petición
  ///
  /// Datos/información que se envían en la petición
  final Map<String, String>? body;

  /// Parámetros de la url
  final Map<String, String>? queryParameters;

  /// Headers adicionales para la petición
  final Map<String, String>? additionalHeaders;

  /// Método de la petición
  final HttpRequestType httpRequestMethod;

  HttpEndpoint({
    required this.path,
    required this.httpRequestMethod,
    required this.body,
    required this.queryParameters,
    required this.additionalHeaders,
  });
}
