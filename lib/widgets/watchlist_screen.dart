import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wppb_mini_project/providers/movie_provider.dart';

class WatchlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
      ),
      body: ListView.builder(
        itemCount: movieProvider.watchList.length,
        itemBuilder: (context, index) {
          final movie = movieProvider.watchList[index];

          return ListTile(
            leading: Image.network(movie.imagePath),
            title: Text(movie.name),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => movieProvider.removeFromWatchList(movie),
            ),
          );
        },
      ),
    );
  }
}
