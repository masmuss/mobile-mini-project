import 'package:flutter/material.dart';
import 'package:wppb_mini_project/models/movie_model.dart';
import 'package:wppb_mini_project/screens/movie_screen.dart';
import 'package:wppb_mini_project/widgets/movie_list_item.dart';
import 'package:provider/provider.dart';
import 'package:wppb_mini_project/providers/movie_provider.dart';
import 'package:wppb_mini_project/widgets/watchlist_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Movie> movies = Movie.movies;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: _CustomClipper(),
          child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFF000B49),
              child: Center(
                child: Text(
                  'Explore',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 150.0),
        child: Column(
          children: [
            Row(
              children: [
                RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.headline6,
                      children: [
                        TextSpan(
                            text: 'Featured ',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.bold)),
                        const TextSpan(text: 'Movies'),
                      ]),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WatchlistScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                      Icons.bookmark,
                      color: Color(0xFF000B49),
                  ),
                  tooltip: 'Watchlist',
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            for (final movie in movies)
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieScreen(movie: movie),
                    ),
                  );
                },
                child: MovieListItem(
                  imageUrl: movie.imagePath,
                  name: movie.name,
                  information:
                      '${movie.year} | ${movie.category} | ${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}m',
                  trailing: IconButton(
                    onPressed: () {
                      if (Provider.of<MovieProvider>(context, listen: false)
                          .watchList
                          .contains(movie)) {
                        Provider.of<MovieProvider>(context, listen: false)
                            .removeFromWatchList(movie);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${movie.name} removed from watchlist'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                Provider.of<MovieProvider>(context, listen: false)
                                    .addToWatchList(movie);
                              },
                            ),
                          ),
                        );
                      } else {
                        // if movie is not in watchlist, add it and show snack bar and undo button to undo addition
                        Provider.of<MovieProvider>(context, listen: false)
                            .addToWatchList(movie);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${movie.name} added to watchlist'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                Provider.of<MovieProvider>(context, listen: false)
                                    .removeFromWatchList(movie);
                              },
                            ),
                          ),
                        );
                      }
                    },
                    icon: Provider.of<MovieProvider>(context)
                            .watchList
                            .contains(movie)
                        ? const Icon(
                            Icons.bookmark,
                            color: Color(0xFF000B49),
                          )
                        : const Icon(
                            Icons.bookmark_border,
                            color: Color(0xFF000B49),
                          ),
                  ),
                ),
              )
          ],
        ),
      )),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
