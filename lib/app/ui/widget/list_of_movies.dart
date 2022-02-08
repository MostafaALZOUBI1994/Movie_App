import 'package:flutter/material.dart';
import 'package:movie_app/app/bloc/movie_detail_bloc.dart';
import 'package:movie_app/app/model/movie.dart';
import 'package:movie_app/app/ui/screen/detail_screen.dart';
import 'package:movie_app/app/ui/widget/network_image_widget.dart';
import 'package:movie_app/app/utils/api_utils.dart';

// this reusable widget that used by all list of movies by passing snapshot to it
class ListOfMovies extends StatelessWidget {
  // this snapshot that passed by all the lists of movies
  final AsyncSnapshot snapshot;

  const ListOfMovies({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData) {
      if (snapshot.data?.error != null && snapshot.data?.error.length != 0) {
        WidgetsBinding.instance?.addPostFrameCallback(
            (_) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
      return Container(
        height: MediaQuery.of(context).size.height / 3.5,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data?.movies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int index) {
            List<Movie> movies = snapshot.data?.movies;
            return InkWell(
              onTap: () {
                // get movie detail
                movieDetailBloc.getMovieDetail(movies[index].id);
                //open bottom sheet that show movie detail
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Container(
                    height: MediaQuery.of(context).size.height * 0.85,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: const MovieDetailScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.height / 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NetworkImageWidget(
                          imageUrl:
                              "${ApiUtils.imageUrl}${movies[index].posterPath}"),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          child: Text(
                            movies[index].title,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else if (snapshot.hasError) {
      WidgetsBinding.instance?.addPostFrameCallback(
          (_) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
  }
}
