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
    on<GetMoviesLoadingEvent>(_onGetMoviesLoading);
    on<GetMoreMoviesEvent>(_onGetMoreMovies);
  }

  Future<void> _onGetMoviesLoading(GetMoviesLoadingEvent event, Emitter<GetMoviesState> emit) async {
    List<Movie> movies = [];
    emit(GetMoviesLoading(movies: [], currentPage: 1, isLoadingMore: false));
    try {
      movies = await _useCase.getMovies(index);
      emit(GetMoviesSuccess(movies: movies, currentPage: 1, isLoadingMore: false));
    } catch (e) {
      emit(GetMoviesError(error: e, movies: [], currentPage: 0, isLoadingMore: false));
    }
  }

  Future<void> _onGetMoreMovies(GetMoreMoviesEvent event, Emitter<GetMoviesState> emit) async {
    if (state is GetMoviesLoading) return;
    emit(GetMoviesLoading(movies: state.movies, currentPage: state.currentPage, isLoadingMore: true));
    try {
      final nextIndex = state.currentPage + 1;
      final newMovieList = await _useCase.getMovies(nextIndex);
      if (newMovieList.isEmpty) {
        emit(GetMoviesSuccess(
          movies: state.movies,
          currentPage: state.currentPage,
          isLoadingMore: false,
        ));
        return;
      }
      emit(GetMoviesSuccess(
        movies: [...state.movies, ...newMovieList],
        currentPage: nextIndex,
        isLoadingMore: false,
      ));
    } catch (e) {
      emit(GetMoviesError(error: e, movies: [], currentPage: 0, isLoadingMore: false));
    }
  }
}
