part of 'get_it_configuration.dart';

void _setupRepositoryImplementation() {
  _getIt.registerFactory<GetMoviesByIndexRepository>(() => GetMoviesByIndexImplementation(
        httpDataSource: _getIt<HttpDataSource>(),
      ));

  _getIt.registerFactory<GetMovieDescriptionByIdRepository>(() => GetMovieDescriptionByIdImplementation(
        httpDataSource: _getIt<HttpDataSource>(),
      ));
}
