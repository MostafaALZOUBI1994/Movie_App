import 'package:flutter/material.dart';
import 'package:movie_app/app/bloc/movie_detail_bloc.dart';
import 'package:movie_app/app/model/movie.dart';
import 'package:movie_app/app/resourse/repository/movie_detail_repository.dart';
import 'package:movie_app/app/ui/widget/network_image_widget.dart';
import 'package:movie_app/app/ui/widget/video_player.dart';
import 'package:movie_app/app/utils/api_utils.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder<MovieDetailRepository>(
          //get the stream from stream controller
          stream: movieDetailBloc.subject.stream,
          builder: (context, AsyncSnapshot<MovieDetailRepository> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data?.error != null &&
                  snapshot.data?.error.length != 0) {
                WidgetsBinding.instance?.addPostFrameCallback((_) =>
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          "☹️☹️☹️Sorry We Have Error check your internet connection☹️☹️☹️"),
                    )));
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                      "☹️☹️☹️Sorry We Have Error Check your internet connection☹️☹️☹",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center),
                );
              }
              Movie movie = snapshot.data!.movieDetail;
              return ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  //check if the movie has video of not
                  movie.videoIsAvailable
                      ? VideoPlayerWidget(
                          movieTitle: movie.title,
                        )
                      : Container(),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 2.0,
                      child: NetworkImageWidget(
                          imageUrl: "${ApiUtils.imageUrl}${movie.posterPath}")),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // this widgets to build the all rows description of movie
                        _movieInfoRow(context, "Title", movie.title),
                        _movieInfoRow(
                            context, "Budget", movie.budget.toString()),
                        _movieInfoRow(context, "Original Language",
                            movie.originalLanguage.toString()),
                        _movieInfoRow(context, "Original Title",
                            movie.originalLanguage.toString()),
                        _movieInfoRow(context, "overview", movie.overview),
                        _movieInfoRow(
                            context, "Release Date", movie.releaseDate),
                        _movieInfoList(context, "Genres", movie.genres!),
                        _movieInfoList(
                            context, "Spoken Languages", movie.spokenLanguages)
                      ],
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              WidgetsBinding.instance?.addPostFrameCallback((_) =>
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        "☹️☹️☹️Sorry We Have Error check your internet connection☹️☹️☹️"),
                  )));
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    "☹️☹️☹️Sorry We Have Error Check your internet connection☹️☹️☹",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }

// this widget build the row that has only one info
  Widget _movieInfoRow(BuildContext context, String info, String description) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("$info : ",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  fontWeight: FontWeight.bold)),
          Expanded(
              child: Text(description,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

// this widget build the row that has only List of info
  Widget _movieInfoList(BuildContext context, String info, List descriptions) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("$info : ",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  fontWeight: FontWeight.bold)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var description in descriptions)
                Text(description.name,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }
}
