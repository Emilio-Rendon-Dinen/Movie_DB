part of 'get_it_configuration.dart';

void _setupDataSource() {
  _getIt.registerFactory<HttpDataSource>(() => HttpDataSource());
}
