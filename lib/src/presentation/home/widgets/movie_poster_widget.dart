import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/src/core/constants/constants.dart';
import 'package:movie_db/src/domain/entities/movie.dart';

class MoviePosterWidget extends StatelessWidget {
  final String url;
  final String movieName;
  final void Function(Movie) onTap;
  const MoviePosterWidget({
    required this.url,
    required this.movieName,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: '${Constants.imageUrl}$url',
            fit: BoxFit.cover,
            errorWidget: (context, _, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            movieName,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        )
      ],
    ));
  }
}
