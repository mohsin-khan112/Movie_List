import 'package:dignizant_demo/Model/Movie.dart';

abstract class MoviesListState {
  @override
  List<Object?> get props => [];
}

class MoviesInitialState extends MoviesListState {}

class ShowMovieListSuccessState extends MoviesListState {
  List<Movie>? movieList = [];

  ShowMovieListSuccessState({this.movieList});

  @override
  List<Object?> get props => [movieList];
}
