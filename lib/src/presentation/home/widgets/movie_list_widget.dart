import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/src/domain/entities/movie.dart';
import 'package:movie_db/src/presentation/home/bloc/get_movies_bloc.dart';
import 'package:movie_db/src/presentation/home/widgets/movie_poster_widget.dart';

class MovieListWidget extends StatefulWidget {
  final List<Movie> movieList;
  final bool isLoadingMore;
  final Function onLoadMore;

  const MovieListWidget({
    required this.movieList,
    required this.isLoadingMore,
    required this.onLoadMore,
    super.key,
  });

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

//Mixin necesario para mantener el estado del scroll
class _MovieListWidgetState extends State<MovieListWidget> with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true; //Necesario para mantener el estado del scroll
  void _onScroll() {
    if (_isBottom && !widget.isLoadingMore) {
      widget.onLoadMore();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); //Necesario para mantener el estado del scroll
    return BlocBuilder<GetMoviesBloc, GetMoviesState>(
      builder: (context, state) {
        if (state is GetMoviesInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetMoviesError && state.movies.isEmpty) {
          return Center(child: Text('Error: ${state.error}'));
        }

        return Column(
          children: [
            Expanded(
              child: GridView.builder(
                key: const PageStorageKey('movieGrid'), //Necesario para mantener el estado del scroll
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                padding: const EdgeInsets.all(8.0),
                itemCount: widget.movieList.length,
                itemBuilder: (context, index) {
                  final movie = widget.movieList[index];
                  return MoviePosterWidget(
                    url: movie.poster ?? '',
                    movieName: movie.title,
                    onTap: (movieSelected) {},
                  );
                },
              ),
            ),
            if (state is GetMoviesLoading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      },
    );
  }
}
