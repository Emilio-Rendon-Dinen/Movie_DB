part of 'get_it_configuration.dart';

void _setupApiService() {
  _getIt.registerFactory<ApiService>(() => ApiService());
}
