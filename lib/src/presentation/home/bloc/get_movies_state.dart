part of 'get_movies_bloc.dart';

sealed class GetMoviesState {
  final List<Movie> movies;
  final int currentPage;
  final bool isLoadingMore;
  const GetMoviesState({
    required this.movies,
    required this.currentPage,
    required this.isLoadingMore,
  });
}

final class GetMoviesInitial extends GetMoviesState {
  GetMoviesInitial() : super(movies: [], currentPage: 1, isLoadingMore: false);
}

final class GetMoviesLoading extends GetMoviesState {
  GetMoviesLoading({required super.movies, required super.currentPage, required super.isLoadingMore});
}

final class GetMoviesSuccess extends GetMoviesState {
  GetMoviesSuccess({required super.movies, required super.currentPage, required super.isLoadingMore});
}

final class GetMoviesError extends GetMoviesState {
  final dynamic error;
  const GetMoviesError({
    this.error,
    required super.movies,
    required super.currentPage,
    required super.isLoadingMore,
  });
}
