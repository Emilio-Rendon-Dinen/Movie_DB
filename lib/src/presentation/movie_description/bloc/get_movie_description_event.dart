part of 'get_movie_description_bloc.dart';

sealed class GetMovieDescriptionEvent {
  const GetMovieDescriptionEvent();
}

final class GetMovieDescriptionLoadedEvent extends GetMovieDescriptionEvent {
  const GetMovieDescriptionLoadedEvent();
}

final class GetMovieDescriptionLoadingEvent extends GetMovieDescriptionEvent {
  const GetMovieDescriptionLoadingEvent();
}
