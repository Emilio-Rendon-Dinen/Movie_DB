import 'package:movie_db/src/data/source/remote/http_endpoint.dart';
import 'package:movie_db/src/data/source/remote/http_request_type.dart';

class GetMoviesEndpoint extends HttpEndpoint {
  final int index;
  GetMoviesEndpoint({
    required this.index,
  }) : super(
          path: 'discover/movie?include_adult=false&include_video=false&language=en-US&page=$index',
          httpRequestMethod: HttpRequestType.get,
          body: null,
          queryParameters: null,
          additionalHeaders: null,
        );
}
