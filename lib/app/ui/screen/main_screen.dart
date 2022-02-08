import 'package:flutter/material.dart';
import 'package:movie_app/app/bloc/lastest_movie_bloc.dart';
import 'package:movie_app/app/bloc/top_rated_list_bloc.dart';
import 'package:movie_app/app/bloc/upcoming_list_bloc.dart';
import 'package:movie_app/app/ui/widget/latest_movie.dart';
import 'package:movie_app/app/ui/widget/network_image_widget.dart';
import 'package:movie_app/app/ui/widget/popular_movies_list.dart';
import 'package:movie_app/app/ui/widget/top_rated_list.dart';
import 'package:movie_app/app/ui/widget/upcoming_list.dart';
import 'package:movie_app/app/utils/api_utils.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(203, 203, 203, 1.0),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                // the most height that can expand
                expandedHeight: MediaQuery.of(context).size.height / 3,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Movie App",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02)),
                    background: NetworkImageWidget(
                        // random image
                        imageUrl:
                            "${ApiUtils.imageUrl}oUoFM0f4YFW2jw7AymxUXYvGv7S.jpg")),
              )
            ];
          },
          body: ListView(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              children: [
                Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: ExpansionTile(
                      collapsedIconColor: Colors.black,
                      iconColor: Colors.black,
                      onExpansionChanged: (isExpanded) {
                        // this control updating latest movie when openPolling true this will update every 30 seconds
                        // when its false will stop updating
                        latestMovieBloc.openPolling = isExpanded;
                      },
                      initiallyExpanded: true,
                      title: Text("Latest Movie",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02)),
                      children: const [LatestMovie()],
                    )),
                Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: ExpansionTile(
                      collapsedIconColor: Colors.black,
                      iconColor: Colors.black,
                      initiallyExpanded: true,
                      title: Text(
                        "Popular Movies",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                      children: const [PopularMoviesList()],
                    )),
                Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: ExpansionTile(
                      collapsedIconColor: Colors.black,
                      iconColor: Colors.black,
                      onExpansionChanged: (isExpanded) {
                        if (isExpanded) {
                          topRatedMoviesListBloc.getTopRatedMovies();
                        }
                      },
                      initiallyExpanded: false,
                      title: Text("Top Rated Movies",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02)),
                      children: const [TopRatedMoviesList()],
                    )),
                Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    child: ExpansionTile(
                      collapsedIconColor: Colors.black,
                      iconColor: Colors.black,
                      onExpansionChanged: (isExpanded) {
                        if (isExpanded) {
                          upcomingMoviesListBloc.getUpComingMovies();
                        }
                      },
                      initiallyExpanded: false,
                      title: Text("Upcoming Movies",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02)),
                      children: const [UpcomingMoviesList()],
                    )),
              ])),
    );
  }
}
