import 'package:flutter/material.dart';
import 'package:movie_app/app/bloc/lastest_movie_bloc.dart';
import 'package:movie_app/app/resourse/repository/movie_list_repository.dart';
import 'package:movie_app/app/ui/widget/list_of_movies.dart';

class LatestMovie extends StatefulWidget {
  const LatestMovie({Key? key}) : super(key: key);

  @override
  _LatestMovieState createState() => _LatestMovieState();
}

class _LatestMovieState extends State<LatestMovie> {
  @override
  void initState() {
    super.initState();
    // call the latest movie function inside bloc
    latestMovieBloc.getLastestMovie();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieListRepository>(
        // get stream from stream controller and pass it to stream controller
        stream: latestMovieBloc.subject.stream,
        builder: (context, AsyncSnapshot<MovieListRepository> snapshot) {
          return ListOfMovies(
            snapshot: snapshot,
          );
        });
  }
}
