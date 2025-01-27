import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/src/core/configuration/dependency_injection/get_it_configuration.dart';
import 'package:movie_db/src/core/constants/constants.dart';
import 'package:movie_db/src/domain/use_cases/get_movie_description_by_id_use_case.dart';
import 'package:movie_db/src/presentation/movie_description/bloc/get_movie_description_bloc.dart';

class MovieDescription extends StatelessWidget {
  final String id;
  const MovieDescription({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMovieDescriptionBloc(useCase: getIt.get<GetMovieDescriptionByIdUseCase>(), id: int.tryParse(id) ?? 0)
        ..add(
          const GetMovieDescriptionLoadingEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movie info list'),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<GetMovieDescriptionBloc, GetMovieDescriptionState>(
            builder: (context, state) {
              if (state is GetMovieDescriptionLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetMovieDescriptionSuccess) {
                return ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5, // Toma la mitad del alto
                      child: CachedNetworkImage(
                        imageUrl: '${Constants.imageUrl}${state.description?.poster}',
                        fit: BoxFit.fitHeight,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, _, error) => const Icon(Icons.error),
                      ),
                    ),
                    ListTile(
                      title: Text(state.description!.title),
                    ),
                    ListTile(
                      title: Text(state.description!.budget),
                    ),
                    ListTile(
                      title: Text(state.description!.description),
                    )
                  ],
                );
              } else if (state is GetMovieDescriptionError) {
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
     //width: double.infinity, // Asegura que tome todo el ancho disponible
