import 'package:dignizant_demo/Model/MovieDetailsData.dart';

class ResponseMovieDetails {
  MovieDetailsData? movieDetailsData;

  ResponseMovieDetails.fromJson(Map<String, dynamic> json)
      : movieDetailsData = MovieDetailsData.fromJson(json['data']);
}
