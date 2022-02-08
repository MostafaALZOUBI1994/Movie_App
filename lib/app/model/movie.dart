
import 'package:movie_app/app/model/genre.dart';
import 'package:movie_app/app/model/language.dart';

class Movie {
  Movie({
    required this.adult,
    required this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    this.revenue,
    required this.spokenLanguages,
    required this.title,
    required this.videoIsAvailable,
    required this.voteAverage,
    required this.voteCount,
  });

  late final bool adult;
  late final String backdropPath;
  late final int? budget;
  late final List<Genre>? genres;
  late final String? homepage;
  late final int id;
  late final String? imdbId;
  late final String? originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final posterPath;
  late final String releaseDate;
  late final int? revenue;
  late final List<Language> spokenLanguages;
  late final String title;
  late final bool videoIsAvailable;
  late final double voteAverage;
  late final int voteCount;

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'] ?? "";
    budget = json['budget'];
    genres = json['genres'] == null
        ? []
        : List.from(json['genres']).map((e) => Genre.fromJson(e)).toList();
    homepage = json['homepage'];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'] ?? "";
    releaseDate = json['release_date'];
    spokenLanguages = json['spoken_languages'] == null
        ? []
        : List.from(json['spoken_languages'])
            .map((e) => Language.fromJson(e))
            .toList();
    title = json['title'];
    videoIsAvailable = json['video'];
    voteCount = json['vote_count'];
  }
}
