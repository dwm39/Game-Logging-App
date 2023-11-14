class VideoGame {
  final String title;
  final String posterUrl;

  VideoGame({required this.title, required this.posterUrl});

  factory VideoGame.fromJson(Map<String, dynamic> json) {
    String? jsonStuff;
    if (json["cover"] != null) {
      jsonStuff = json["cover"]["url"];
    }
    jsonStuff ??= "//demofree.sirv.com/nope-not-here.jpg";

    return VideoGame(
      title: json["name"],
      posterUrl: 'http:$jsonStuff',
    );
  }
}
