import 'package:dignizant_demo/Screen/MovieDetails/bloc/MovieDetailsEvent.dart';
import 'package:dignizant_demo/Screen/MovieDetails/bloc/MovieDetailsState.dart';
import 'package:dignizant_demo/Util/RestAPI.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(MoviesDetailsInitialState()) {
    on<ShowMovieDetailsEvent>(_detailsMovie);
  }

   void _detailsMovie(
      ShowMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    var movieDetail = await RestAPI.getMovieDetails(event.id);
    emit(ShowMovieDetailsSuccessState(movieDetails: movieDetail));
  }
}
