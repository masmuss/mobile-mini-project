import 'package:flutter/material.dart';
import 'package:wppb_mini_project/models/movie_model.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _watchList = [];

  List<Movie> get watchList => _watchList;

  void addToWatchList(Movie movie) {
    _watchList.add(movie);
    notifyListeners();
  }

  void removeFromWatchList(Movie movie) {
    _watchList.remove(movie);
    notifyListeners();
  }

  bool isInWatchList(Movie movie) {
    return _watchList.contains(movie);
  }
}