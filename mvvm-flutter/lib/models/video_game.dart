class VideoGame {
  final int id;
  final String title;
  final String posterUrl;
  final String releaseDate;
  final String synopsis;

  VideoGame({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.releaseDate,
    required this.synopsis,
  });

  factory VideoGame.fromJson(Map<String, dynamic> json) {
    String releaseDateHuman = "TBD";
    if (json["release_dates"] != null) {
      releaseDateHuman = json["release_dates"][0]["human"];
    }
    String? jsonStuff;
    if (json["cover"] != null) {
      jsonStuff = json["cover"]["url"];
    }
    jsonStuff ??= "//demofree.sirv.com/nope-not-here.jpg";
    String summary = "";
    if (json["summary"] != null) {
      summary = json["summary"];
    }

    return VideoGame(
      id: json["id"],
      title: json["name"],
      posterUrl: 'http:$jsonStuff',
      releaseDate: releaseDateHuman,
      synopsis: summary,
    );
  }
}
