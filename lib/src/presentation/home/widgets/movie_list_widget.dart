import 'package:flutter/material.dart';
import 'package:movie_db/src/domain/entities/movie.dart';
import 'package:movie_db/src/presentation/home/widgets/movie_poster_widget.dart';

class MovieListWidget extends StatefulWidget {
  final List<Movie> movieList;
  final bool isLoading;
  final Function onLoadMore;

  const MovieListWidget({
    required this.movieList,
    required this.isLoading,
    required this.onLoadMore,
    super.key,
  });

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
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

  void _onScroll() {
    if (_isBottom && !widget.isLoading) {
      widget.onLoadMore();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
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
        if (widget.isLoading)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
