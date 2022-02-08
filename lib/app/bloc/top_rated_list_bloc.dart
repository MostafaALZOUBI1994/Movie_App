import 'package:movie_app/app/resourse/provider/movie_provider.dart';
import 'package:movie_app/app/resourse/repository/movie_list_repository.dart';
import 'package:rxdart/rxdart.dart';

class TopRatedMoviesListBloc {
  // ---------- Movie Repository --------
  final MovieProvider _movieRepository = MovieProvider();

  // ------  Stream Controller that captures the latest item that has been added to the controller -----
  // ------ This subject allows sending data, error and done events to the listener -----
  final BehaviorSubject<MovieListRepository> _subject =
      BehaviorSubject<MovieListRepository>();

  getTopRatedMovies() async {
    MovieListRepository topRatedListMoviesResponse =
        await _movieRepository.getTopRatedMovies();
    _subject.sink.add(topRatedListMoviesResponse);
  }

  dispose() {
    // ------ close the stream controller for adding  more events
    _subject.close();
  }

  BehaviorSubject<MovieListRepository> get subject => _subject;
}

// create one instance for TopRatedMoviesListBloc to prevent create mutliple instance
final topRatedMoviesListBloc = TopRatedMoviesListBloc();
