import 'package:flutter/material.dart';
import 'package:movie_app/app/bloc/upcoming_list_bloc.dart';
import 'package:movie_app/app/resourse/repository/movie_list_repository.dart';
import 'package:movie_app/app/ui/widget/list_of_movies.dart';

class UpcomingMoviesList extends StatelessWidget {
  const UpcomingMoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieListRepository>(
        // get stream from stream controller and pass it to stream controller
        stream: upcomingMoviesListBloc.subject.stream,
        builder: (context, AsyncSnapshot<MovieListRepository> snapshot) {
          return ListOfMovies(
            snapshot: snapshot,
          );
        });
  }
}
