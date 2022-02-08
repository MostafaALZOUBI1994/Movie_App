import 'package:dio/dio.dart';

class ApiUtils {
  // create dio one time and use it in entire application
  static var dio = Dio();
  static String apiKey = "d56ab928b151addbea37a7f0c2321e10";
  static String baseUrl = "https://api.themoviedb.org/3";
  static String popularMoviesUrl = "$baseUrl/movie/popular";
  static String latestMoviesUrl = "$baseUrl/movie/latest";
  static String topRatedMoviesUrl = "$baseUrl/movie/top_rated";
  static String upComingMoviesUrl = "$baseUrl/movie/upcoming";
  static String movieDetailUrl = "$baseUrl/movie/";
  static String imageUrl = "https://image.tmdb.org/t/p/original/";
}
