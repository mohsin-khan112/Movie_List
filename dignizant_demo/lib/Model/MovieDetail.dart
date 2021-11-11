class MovieDetails {
  String? movieYear;
  String? movieLeadHero;
  String? description;
  String? director;
  List<String>? genres;
  String? thumbnail;

  MovieDetails.fromJson(Map<String, dynamic> json)
      : movieYear = json['year'],
        thumbnail = (json['thumbnail'] as String).replaceFirst(
          RegExp("/thumb/"),
          "/medium/",
        ),
        movieLeadHero = json['main_star'],
        description = json['description'],
        director = json['director'],
        genres = json['genres'].cast<String>();
}
