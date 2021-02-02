class ContentModel {
  String id;

  String title;

  String year;

  String type;

  String poster;

  String plot;

  String director;

  String genre;

  String imdbID;

  String actors;

  String production;

  String runtime;

  String released;

  ContentModel(
      {this.id,
      this.title,
      this.year,
      this.type,
      this.poster,
      this.plot,
      this.director,
      this.genre,
      this.imdbID,
      this.actors,
      this.production,
      this.runtime,
      this.released});

  static ContentModel fromJson(dynamic json) {
    ContentModel content = ContentModel(
      id: json['id'],
      title: json['Title'],
      year: json['Year'],
      type: json['Type'],
      poster: json['Poster'],
      plot: json['Plot'],
      director: json['Director'],
      genre: json['Genre'],
      imdbID: json['imdbID'],
      actors: json['Actors'],
      production: json['Production'],
      runtime: json['Runtime'],
      released: json['Released'],
    );
    return content;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'Title': title,
        'Year': year,
        'Type': type,
        'Poster': poster,
        'Plot': plot,
        'Director': director,
        'Genre': genre,
        'imdbID': imdbID,
        'Actors': actors,
        'Production': production,
        'Runtime': runtime,
        'Released': released,
      };

  static List<ContentModel> fromJsonList(dynamic jsonList) {
    List<ContentModel> contents = [];
    for (var json in jsonList) {
      ContentModel content = fromJson(json);
      contents.add(content);
    }
    return contents;
  }
}
