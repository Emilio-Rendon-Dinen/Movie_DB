part of 'get_movie_description_bloc.dart';

sealed class GetMovieDescriptionState {
  final MovieDescription? description;
  const GetMovieDescriptionState({
    required this.description,
  });
}

final class GetMovieDescriptionInitial extends GetMovieDescriptionState {
  GetMovieDescriptionInitial() : super(description: null);
}

final class GetMovieDescriptionLoading extends GetMovieDescriptionState {
  GetMovieDescriptionLoading({required super.description});
}

final class GetMovieDescriptionSuccess extends GetMovieDescriptionState {
  GetMovieDescriptionSuccess({required super.description});
}

final class GetMovieDescriptionError extends GetMovieDescriptionState {
  final dynamic error;
  const GetMovieDescriptionError({
    this.error,
    required super.description,
  });
}
