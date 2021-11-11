import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ShowMovieDetailsEvent extends MovieDetailsEvent {
  final int? id;

  ShowMovieDetailsEvent(this.id);
}
