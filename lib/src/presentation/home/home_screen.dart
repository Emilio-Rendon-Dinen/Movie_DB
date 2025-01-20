import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/src/core/configuration/dependency_injection/get_it_configuration.dart';
import 'package:movie_db/src/domain/use_cases/get_movies_by_index_use_case.dart';
import 'package:movie_db/src/presentation/home/bloc/get_movies_bloc.dart';
import 'package:movie_db/src/presentation/home/widgets/movie_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 1;
    return BlocProvider(
      create: (context) => GetMoviesBloc(useCase: getIt.get<GetMoviesByIndexUseCase>(), index: index)
        ..add(
          const GetMoviesEventLoadingEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movie info list'),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<GetMoviesBloc, GetMoviesState>(
            builder: (context, state) {
              if (state is GetMoviesLoading) {
                return const CircularProgressIndicator();
              } else if (state is GetMoviesSuccess) {
                return MovieListWidget(
                  movieList: state.movies,
                  isLoading: state is GetMoviesLoading,
                  onLoadMore: () {
                    index = index + 1;
                    GetMoviesBloc(useCase: getIt.get<GetMoviesByIndexUseCase>(), index: index).add(
                      const GetMoviesEventLoadingEvent(),
                    );
                  },
                );
              } else if (state is GetMoviesError) {
                return Text('Error: ${state.error}');
              } else {
                return const SizedBox();
              }
            },
          ),
        )),
      ),
    );
  }
}
