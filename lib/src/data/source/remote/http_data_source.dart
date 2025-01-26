import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_db/src/core/configuration/services/printer_service.dart';
import 'package:movie_db/src/data/source/response_validator.dart';
import 'package:movie_db/src/data/source/remote/http_endpoint.dart';
import 'package:movie_db/src/data/source/remote/http_request_type.dart';

/// Clase que ejecuta peticiones HTTP.
class HttpDataSource {
  final Client _client;

  /// Clase para ejecutar peticiones HTTP con la librería http.
  ///
  /// [client] es el cliente http que se usará para realizar las peticiones.
  HttpDataSource({
    Client? client,
  }) : _client = client ?? Client();

  /// Ejecuta la petición HTTP a través de las propiedades de [HttpEndpoint].
  ///
  /// Retorna un [Map] con la respuesta de la petición o bien un [String] con el mensaje o código de error.
  Future<dynamic> execute(HttpEndpoint httpEndPoint) async {
    try {
      final Uri url = Uri.parse('https://api.themoviedb.org/3/${httpEndPoint.path}').replace(queryParameters: httpEndPoint.queryParameters);

      final Map<String, String> headers = {
        "accept": "application/json",
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YzFmY2Q4MmU3ODM2MzliN2NhZjU5ZTY5ZDk3ZGRmYyIsIm5iZiI6MTczNDcxMzMwMC42ODcsInN1YiI6IjY3NjU5ZmQ0OGYxMGMyNzQ2YjkwZDk3MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CwViaXUGgejuuHUtIGjIt7Yv9rPMFjGgiLtFGTCJah4"
      };
      if (httpEndPoint.additionalHeaders != null) {
        headers.addAll(httpEndPoint.additionalHeaders!);
      }

      /// Identa una respuesta en modo de json
      const JsonEncoder jsonEncoder = JsonEncoder.withIndent(' ');

      PrinterService.print('Method: ${httpEndPoint.httpRequestMethod.name}', tag: 'HttpDataSource');
      PrinterService.print('Path: ${httpEndPoint.path}', tag: 'HttpDataSource');
      PrinterService.print('Body: ${jsonEncoder.convert(httpEndPoint.body)}', tag: 'HttpDataSource');
      PrinterService.print('Params: ${jsonEncoder.convert(httpEndPoint.queryParameters)}', tag: 'HttpDataSource');
      PrinterService.print('Headers: ${jsonEncoder.convert(headers)}', tag: 'HttpDataSource');

      Response response;

      switch (httpEndPoint.httpRequestMethod) {
        case HttpRequestType.get:
          response = await _client.get(url, headers: headers);
          break;
        case HttpRequestType.put:
          response = await _client.put(url, headers: headers, body: httpEndPoint.body);
          break;
        case HttpRequestType.post:
          response = await _client.post(url, headers: headers, body: httpEndPoint.body);
          break;
        case HttpRequestType.delete:
          response = await _client.delete(url, headers: headers, body: httpEndPoint.body);
          break;
      }

      dynamic json = jsonDecode(response.body);
      PrinterService.print('Response status: ${response.statusCode}', tag: 'HttpDataSource');
      PrinterService.print('Response body: ${jsonEncoder.convert(json)}', tag: 'HttpDataSource');
      PrinterService.print('Response reasonPhrase: ${response.reasonPhrase}', tag: 'HttpDataSource');

      return ResponseValidator.validateResponse(response);
    } catch (e) {
      return Future.error(e);
    }
  }
}
