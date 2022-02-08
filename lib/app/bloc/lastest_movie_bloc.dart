import 'dart:async';
import 'package:movie_app/app/resourse/provider/movie_provider.dart';
import 'package:movie_app/app/resourse/repository/movie_list_repository.dart';
import 'package:rxdart/rxdart.dart';

class LatestMovieBloc {
  // ---------- Movie Repository --------
  final MovieProvider _movieRepository = MovieProvider();

  // ------  Stream Controller that captures the latest item that has been added to the controller -----
  // ------ This subject allows sending data, error and done events to the listener -----
  final BehaviorSubject<MovieListRepository> _subject =
      BehaviorSubject<MovieListRepository>();

  // -------- this variable for update latest movie every 30 seconds when its true ---------
  bool openPolling = true;

  getLastestMovie() async {
    // -------- this called for first time the user land on main screen to prevent wait 30 seconds in the first time ---------
    MovieListRepository latestMovieResponse =
        await _movieRepository.getLatestMovies();
    _subject.sink.add(latestMovieResponse);
    // -------- this timer for scedule update every 30 seconds ---------
    Timer.periodic(const Duration(seconds: 30), (timer) async {
      // -------- this condition to check if the latest movie card is Exapnded---------
      if (openPolling) {
        //print(timer.tick);
        latestMovieResponse = await _movieRepository.getLatestMovies();
        _subject.sink.add(latestMovieResponse);
      } else {
        // -------- cancel timer when user collapse the latest movie card ---------
        timer.cancel();
      }
    });
  }

  dispose() {
    // ------ close the stream controller for adding  more events
    _subject.close();
  }

  BehaviorSubject<MovieListRepository> get subject => _subject;
}

// create one instance for LatestMovieBloc to prevent create mutliple instances
final latestMovieBloc = LatestMovieBloc();
