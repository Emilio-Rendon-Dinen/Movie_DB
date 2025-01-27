import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/src/domain/entities/movie_description.dart';
import 'package:movie_db/src/domain/use_cases/get_movie_description_by_id_use_case.dart';

part 'get_movie_description_event.dart';
part 'get_movie_description_state.dart';

class GetMovieDescriptionBloc extends Bloc<GetMovieDescriptionEvent, GetMovieDescriptionState> {
  final GetMovieDescriptionByIdUseCase _useCase;
  final int id;
  GetMovieDescriptionBloc({
    required GetMovieDescriptionByIdUseCase useCase,
    required this.id,
  })  : _useCase = useCase,
        super(GetMovieDescriptionInitial()) {
    on<GetMovieDescriptionLoadingEvent>(_onGetMovieDescriptionLoading);
  }
  Future<void> _onGetMovieDescriptionLoading(GetMovieDescriptionLoadingEvent event, Emitter<GetMovieDescriptionState> emit) async {
    MovieDescription movie;
    emit(GetMovieDescriptionLoading(description: null));
    try {
      movie = await _useCase.getDescription(id);
      emit(GetMovieDescriptionSuccess(description: movie));
    } catch (e) {
      emit(GetMovieDescriptionError(error: e, description: null));
    }
  }
}
