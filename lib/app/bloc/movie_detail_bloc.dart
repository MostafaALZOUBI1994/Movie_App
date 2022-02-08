import 'package:movie_app/app/resourse/provider/movie_provider.dart';
import 'package:movie_app/app/resourse/repository/movie_detail_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc {
  // ---------- Movie Repository --------
  final MovieProvider _movieRepository = MovieProvider();

  // ------  Stream Controller that captures the latest item that has been added to the controller -----
  // ------ This subject allows sending data, error and done events to the listener -----
  final BehaviorSubject<MovieDetailRepository> _subject =
      BehaviorSubject<MovieDetailRepository>();

  getMovieDetail(int movieId) async {
    MovieDetailRepository movieDetailResponse =
        await _movieRepository.getMovieDetail(movieId);
    _subject.sink.add(movieDetailResponse);
  }

  dispose() {
    // ------ close the stream controller for adding  more events
    _subject.close();
  }

  BehaviorSubject<MovieDetailRepository> get subject => _subject;
}

// create one instance for MovieDetailBloc to prevent create mutliple instances
final movieDetailBloc = MovieDetailBloc();
