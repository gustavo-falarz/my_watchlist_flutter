class Content {
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

  Content(
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

  static Content fromJson(dynamic json) {
    Content content = Content(
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

  static List<Content> fromJsonList(dynamic response) {
    List<Content> contents = [];
    Iterable jsonList = response['data'];
    for (var json in jsonList) {
      Content content = fromJson(json);
      contents.add(content);
    }
    return contents;
  }
}
