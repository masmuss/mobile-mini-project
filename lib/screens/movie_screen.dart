import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wppb_mini_project/models/movie_model.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  const MovieScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ..._buildBackground(context, movie),
          _buildMovieInformation(context),
          _buildActions(context),
        ],
      ),
    );
  }

  Positioned _buildActions(BuildContext context) {
    return Positioned(
        bottom: 50,
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15.0),
                  primary: const Color(0xFFFF7272),
                  fixedSize:
                      Size(MediaQuery.of(context).size.width * 0.425, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () {},
                child: RichText(
                  text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'Add to ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: 'Watchlist'),
                      ]),
                ),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15.0),
                  primary: Colors.white,
                  fixedSize:
                      Size(MediaQuery.of(context).size.width * 0.425, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => _MoviePlayer(movie: movie),
                      ));
                },
                child: RichText(
                  text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!,
                      children: [
                        TextSpan(
                          text: 'Start ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: 'Watching'),
                      ]),
                ),
              )
            ])));
  }

  Positioned _buildMovieInformation(BuildContext context) {
    return Positioned(
        bottom: 150,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(movie.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10.0),
              Text(
                  '${movie.year} | ${movie.category} | ${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}m',
                  style: const TextStyle(color: Colors.white, fontSize: 14)),
              const SizedBox(height: 10.0),
              RatingBar.builder(
                initialRating: 3.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemSize: 20,
                unratedColor: Colors.white,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0.1),
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(height: 20),
              Text(movie.synopsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(height: 1.75, color: Colors.white)),
            ],
          ),
        ));
  }

  List<Widget> _buildBackground(context, movie) {
    return [
      Container(
        height: double.infinity,
        color: const Color(0xFF000B49),
      ),
      Image.network(
        movie.imagePath,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.cover,
      ),
      const Positioned.fill(
          child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.5],
            colors: [
              Colors.transparent,
              Color(0xFF000B49),
            ],
          ),
        ),
      ))
    ];
  }
}

class _MoviePlayer extends StatefulWidget {
  final Movie movie;
  const _MoviePlayer({Key? key, required this.movie}) : super(key: key);

  @override
  __MoviePlayerState createState() => __MoviePlayerState();
}

class __MoviePlayerState extends State<_MoviePlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState(){
    super.initState();
    // get video from youtube
    _videoPlayerController = VideoPlayerController.asset(widget.movie.videoPath)
    ..initialize().then((value) {
        setState(() {});
      });

    _chewieController = ChewieController(videoPlayerController: _videoPlayerController, autoPlay: true, aspectRatio: 16 / 9);

    @override
    void dispose() {
      _videoPlayerController.dispose();
      _chewieController.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Chewie(
          controller: _chewieController,
        ),
      )
    );
  }
}
