import 'package:dignizant_demo/Model/MovieDetail.dart';

class MovieDetailsData {
  MovieDetails? movieDetails;

  MovieDetailsData.fromJson(Map<String, dynamic> json)
      : movieDetails = MovieDetails.fromJson(json['movie']);
}
