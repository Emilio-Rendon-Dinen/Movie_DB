part of 'get_it_configuration.dart';

void _setupUseCase() {
  _getIt.registerFactory<GetMoviesByIndexUseCase>(() => GetMoviesByIndexUseCase(_getIt.get<GetMoviesByIndexRepository>()));
}
