import 'package:get_it/get_it.dart';
import 'package:movie_db/src/data/implementations/get_movies_by_index_implementation.dart';
import 'package:movie_db/src/data/source/api_services.dart';
import 'package:movie_db/src/domain/repositories/get_movies_by_index_repository.dart';
import 'package:movie_db/src/domain/use_cases/get_movies_by_index_use_case.dart';
part 'get_it_use_case.dart';
part 'get_it_repository_implementation.dart';
part 'get_it_api_services.dart';

final GetIt _getIt = GetIt.instance;

/// Configura las dependencias de la aplicación
void getItConfiguration() {
  _setupApiService();
  _setupRepositoryImplementation();
  _setupUseCase();
}

final GetIt getIt = _getIt;
