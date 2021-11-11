import 'package:dignizant_demo/Screen/MovieDetails/MovieDetailsScreen.dart';
import 'package:dignizant_demo/Screen/MoviesList/bloc/MovieListEvent.dart';
import 'package:dignizant_demo/Screen/MoviesList/bloc/MoviesListBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/MovieListState.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({Key? key}) : super(key: key);

  @override
  _MoviesListScreenState createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  MoviesListBloc moviesListBloc = MoviesListBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => moviesListBloc,
      child: BlocListener<MoviesListBloc, MoviesListState>(
        listener: (context, state) async {},
        child: BlocBuilder<MoviesListBloc, MoviesListState>(
            builder: (context, state) {
          if (state is MoviesInitialState) {
            moviesListBloc.add(ShowMoviesListEvent());
          }
          return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: Text("Movies"),
                backgroundColor: Colors.black,
              ),
              body: state is ShowMovieListSuccessState
                  ? GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 0.66,
                      children:
                          List.generate(state.movieList?.length ?? 0, (index) {
                        return Container(
                          child: Card(
                            color: Color(0xff27282C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetailsScreen(
                                          state.movieList![index].id,
                                          state.movieList![index].name)),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 0.8,
                                      child: Image.network(
                                        '${state.movieList![index].thumbnail ?? AspectRatio(
                                              aspectRatio: 0.8,
                                              child: Container(
                                                color: Color(0xff27282C),
                                              ),
                                            )}',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Center(
                                    child: Text(
                                      "${state.movieList![index].name}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Center(
                                    child: Text(
                                      "${state.movieList![index].year}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    )
                  : null);
        }),
      ),
    );
  }
}
