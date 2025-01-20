import 'package:bloc/bloc.dart';
import 'package:movie_db/src/domain/entities/movie.dart';
import 'package:movie_db/src/domain/use_cases/get_movies_by_index_use_case.dart';

part 'get_movies_event.dart';
part 'get_movies_state.dart';

class GetMoviesBloc extends Bloc<GetMoviesEvent, GetMoviesState> {
  final GetMoviesByIndexUseCase _useCase;
  final int index;
  GetMoviesBloc({
    required GetMoviesByIndexUseCase useCase,
    required this.index,
  })  : _useCase = useCase,
        super(GetMoviesInitial()) {
    on<GetMoviesEventLoadingEvent>(_onGetMoviesLoading);
  }

  Future<void> _onGetMoviesLoading(GetMoviesEventLoadingEvent event, Emitter<GetMoviesState> emit) async {
    List<Movie> movies = [];
    emit(GetMoviesLoading());
    try {
      movies = await _useCase.getMovies(index);
    } catch (e) {
      emit(GetMoviesError(error: e));
    }

    emit(GetMoviesSuccess(
      movies: movies,
    ));
  }
}
