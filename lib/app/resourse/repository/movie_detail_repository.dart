import '../../model/movie.dart';

class MovieDetailRepository {
  final Movie movieDetail;
  final String error;

  MovieDetailRepository(this.movieDetail, this.error);

  MovieDetailRepository.fromJson(Map<String, dynamic> json)
      : movieDetail = Movie.fromJson(json),
        error = "";

  MovieDetailRepository.withError(String errorValue)
      : movieDetail = Movie(
            adult: false,
            voteCount: 0,
            backdropPath: "",
            budget: 0,
            genres: [],
            homepage: "",
            id: 0,
            imdbId: "",
            originalLanguage: "",
            originalTitle: "",
            overview: "",
            popularity: 0,
            posterPath: "",
            releaseDate: "",
            revenue: 0,
            spokenLanguages: [],
            title: "",
            videoIsAvailable: false,
            voteAverage: 0.0),
        error = errorValue;
}
