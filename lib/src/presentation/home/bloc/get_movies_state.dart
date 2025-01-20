part of 'get_movies_bloc.dart';

sealed class GetMoviesState {
  const GetMoviesState();
}

final class GetMoviesInitial extends GetMoviesState {}

final class GetMoviesLoading extends GetMoviesState {}

final class GetMoviesSuccess extends GetMoviesState {
  final List<Movie> movies;
  const GetMoviesSuccess({
    required this.movies,
  });
}

final class GetMoviesError extends GetMoviesState {
  final dynamic error;
  const GetMoviesError({this.error});
}
