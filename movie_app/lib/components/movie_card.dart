import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../pages/movie_details.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie, this.isDetaills = false});

  final Movie movie;
  final bool isDetaills;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(movie.title),
        subtitle: Text("Director: ${movie.director}"),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(movie.images[0]),
        ),
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 75),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                          text: 'Release: ',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(text: '${movie.released} \n'),
                      TextSpan(
                        text: 'Plot: ',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '${movie.plot} '),
                    ],
                  ),
                ),
                isDetaills
                    ? const Text("")
                    : TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetails(
                                        movie: movie,
                                      )));
                        },
                        child: const Text('Read More'),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
