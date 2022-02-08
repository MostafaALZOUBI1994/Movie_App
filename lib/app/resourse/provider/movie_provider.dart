import 'package:dio/dio.dart';
import 'package:movie_app/app/resourse/repository/movie_detail_repository.dart';
import 'package:movie_app/app/resourse/repository/movie_list_repository.dart';
import 'package:movie_app/app/utils/api_utils.dart';

class MovieProvider {
  var params = {"api_key": ApiUtils.apiKey, "language": "en-US"};

  Future<MovieListRepository> getLatestMovies() async {
    try {
      // response that will recieved from get request
      Response response = await ApiUtils.dio
          .get(ApiUtils.latestMoviesUrl, queryParameters: params);
      // convert the response  to list to pass it in view as a list beacause this api get one object only
      var newResponse = {
        // add results key to deal with the response like any list of movie we have
        "results": [response.data]
      };
      // parse json to list of objects
      return MovieListRepository.fromJson(newResponse);
    } catch (error, stacktrace) {
      print(
          "Exception occured in getLatestMovies: $error stackTrace: $stacktrace");
      return MovieListRepository.withError("$error");
    }
  }

  Future<MovieListRepository> getPopularMovies() async {
    try {
      // response that will recieved from get request
      Response response = await ApiUtils.dio
          .get(ApiUtils.popularMoviesUrl, queryParameters: params);
      // parse json to list of objects
      return MovieListRepository.fromJson(response.data);
    } catch (error, stacktrace) {
      print(
          "Exception occured in getPopularMovies: $error stackTrace: $stacktrace");
      return MovieListRepository.withError("$error");
    }
  }

  Future<MovieListRepository> getTopRatedMovies() async {
    try {
      // response that will recieved from get request
      Response response = await ApiUtils.dio
          .get(ApiUtils.topRatedMoviesUrl, queryParameters: params);
      // parse json to list of objects
      return MovieListRepository.fromJson(response.data);
    } catch (error, stacktrace) {
      print(
          "Exception occured in getTopRatedMovies: $error stackTrace: $stacktrace");
      return MovieListRepository.withError("$error");
    }
  }

  Future<MovieListRepository> getUpComingMovies() async {
    try {
      // response that will recieved from get request
      Response response = await ApiUtils.dio
          .get(ApiUtils.upComingMoviesUrl, queryParameters: params);
      // parse json to list of objects
      return MovieListRepository.fromJson(response.data);
    } catch (error, stacktrace) {
      print(
          "Exception occured in getUpComingMovies: $error stackTrace: $stacktrace");
      return MovieListRepository.withError("$error");
    }
  }

  Future<MovieDetailRepository> getMovieDetail(int movieId) async {
    try {
      // response that will recieved from get request
      Response response = await ApiUtils.dio
          .get("${ApiUtils.movieDetailUrl}$movieId", queryParameters: params);
      // parse json to list of objects
      return MovieDetailRepository.fromJson(response.data);
    } catch (error, stacktrace) {
      print(
          "Exception occured in getMovieDetail: $error stackTrace: $stacktrace");
      return MovieDetailRepository.withError("$error");
    }
  }
}
