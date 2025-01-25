part of 'get_it_configuration.dart';

void _setupRepositoryImplementation() {
  _getIt.registerFactory<GetMoviesByIndexRepository>(() => GetMoviesByIndexImplementation(
        httpDataSource: _getIt<HttpDataSource>(),
      ));
}
