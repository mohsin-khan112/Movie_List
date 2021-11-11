import 'package:dignizant_demo/Model/MovieDetail.dart';
import 'package:equatable/equatable.dart';

abstract class MovieDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MoviesDetailsInitialState extends MovieDetailsState {}


class ShowMovieDetailsSuccessState extends MovieDetailsState {
  MovieDetails? movieDetails;

  ShowMovieDetailsSuccessState({this.movieDetails});

}
