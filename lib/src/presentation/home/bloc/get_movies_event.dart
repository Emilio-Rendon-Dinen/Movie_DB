part of 'get_movies_bloc.dart';

sealed class GetMoviesEvent {
  const GetMoviesEvent();
}

final class GetMoviesLoadedEvent extends GetMoviesEvent {
  const GetMoviesLoadedEvent();
}

final class GetMoreMoviesEvent extends GetMoviesEvent {
  const GetMoreMoviesEvent();
}

final class GetMoviesLoadingEvent extends GetMoviesEvent {
  const GetMoviesLoadingEvent();
}
