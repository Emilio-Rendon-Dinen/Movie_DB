import 'package:movie_db/src/data/source/remote/http_endpoint.dart';
import 'package:movie_db/src/data/source/remote/http_request_type.dart';

class GetMovieDescriptionEndpoint extends HttpEndpoint {
  final int id;
  GetMovieDescriptionEndpoint({
    required this.id,
  }) : super(
          path: 'movie/$id?language=en-US',
          httpRequestMethod: HttpRequestType.get,
          body: null,
          queryParameters: null,
          additionalHeaders: null,
        );
}
