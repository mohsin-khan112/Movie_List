import 'package:dignizant_demo/Screen/MoviesList/bloc/MovieListEvent.dart';
import 'package:dignizant_demo/Screen/MoviesList/bloc/MovieListState.dart';
import 'package:dignizant_demo/Util/RestAPI.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  MoviesListBloc() : super(MoviesInitialState()) {
    on<MoviesListEvent>(_showListMovie);
  }

  void _showListMovie(
      MoviesListEvent event, Emitter<MoviesListState> emit) async {
    var list = await RestAPI.getMovies();
     print("list thumb nail: ${list![0].thumbnail}");
    emit(ShowMovieListSuccessState(movieList: list));
  }


}
