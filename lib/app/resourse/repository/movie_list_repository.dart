import 'package:movie_app/app/model/movie.dart';

class MovieListRepository {
  final List<Movie> movies;
  final String error;

  MovieListRepository(this.movies, this.error);

  MovieListRepository.fromJson(Map<String, dynamic> json)
      : movies = (json["results"] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList(),
        error = "";

  MovieListRepository.withError(String errorValue)
      : movies = [],
        error = errorValue;
}
