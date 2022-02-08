import 'package:flutter/material.dart';
import 'package:movie_app/app/bloc/popular_movies_list_bloc.dart';
import 'package:movie_app/app/resourse/repository/movie_list_repository.dart';
import 'package:movie_app/app/ui/widget/list_of_movies.dart';

class PopularMoviesList extends StatefulWidget {
  const PopularMoviesList({Key? key}) : super(key: key);

  @override
  _PopularMoviesListState createState() => _PopularMoviesListState();
}

class _PopularMoviesListState extends State<PopularMoviesList> {
  @override
  void initState() {
    super.initState();
    // call the latest movie function inside bloc
    popularMoviesListBloc.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieListRepository>(
      // get stream from stream controller and pass it to stream controller
        stream: popularMoviesListBloc.subject.stream,
        builder: (context, AsyncSnapshot<MovieListRepository> snapshot) {
          return ListOfMovies(snapshot: snapshot);
        });
  }
}
