import 'package:dignizant_demo/Screen/MovieDetails/bloc/MovieDetailsBloc.dart';
import 'package:dignizant_demo/Screen/MovieDetails/bloc/MovieDetailsEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/MovieDetailsState.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int? id;
  final String? movieName;

  MovieDetailsScreen(this.id, this.movieName);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetailsBloc movieDetailsBloc = MovieDetailsBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => movieDetailsBloc,
      child: BlocListener<MovieDetailsBloc, MovieDetailsState>(
        listener: (context, state) {},
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MoviesDetailsInitialState) {
              movieDetailsBloc.add(ShowMovieDetailsEvent(widget.id));
            }
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: Text(
                  "${widget.movieName}",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                backgroundColor: Colors.black,
              ),
              body: state is ShowMovieDetailsSuccessState
                  ? SingleChildScrollView(
                      padding: EdgeInsets.only(left: 24, right: 24, top: 24),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 0.8,
                              child: Image.network(
                                "${state.movieDetails!.thumbnail}",
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${state.movieDetails!.movieYear}",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${state.movieDetails!.genres}",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${state.movieDetails!.director}",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${state.movieDetails!.movieLeadHero}",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  : null,
            );
          },
        ),
      ),
    );
  }
}
