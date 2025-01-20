part of 'get_movies_bloc.dart';

sealed class GetMoviesEvent {
  const GetMoviesEvent();
}

final class GetMoviesEventSucceeded extends GetMoviesEvent {
  const GetMoviesEventSucceeded();
}

final class GetMoviesEventLoadingEvent extends GetMoviesEvent {
  const GetMoviesEventLoadingEvent();
}
