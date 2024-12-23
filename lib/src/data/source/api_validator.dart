import 'dart:convert';

import 'package:http/http.dart';

class ApiValidator {
  const ApiValidator();

  static dynamic validateResponse(Response response) {
    // Verificamos que la respuesta sea válida y que el estado sea 200 (OK)
    if (response.statusCode == 200) {
      // Intentamos decodificar la respuesta como JSON
      try {
        dynamic decodedJson = json.decode(response.body);

        // Verificamos que el JSON decodificado sea un Map<String, dynamic>
        if (decodedJson is Map<String, dynamic>) {
          return decodedJson;
        } else {
          // Si el JSON no es del tipo esperado, lanzamos un error
          throw FormatException('La respuesta no es un Map<String, dynamic> como se esperaba.');
        }
      } catch (e) {
        // Si hay un error al decodificar, lanzamos un error de formato
        throw FormatException('Error al decodificar la respuesta JSON: $e');
      }
    } else {
      // Si el estado HTTP no es 200, lanzamos un error
      throw Exception('Error en la solicitud HTTP. Código de estado: ${response.statusCode}');
    }
  }
}
