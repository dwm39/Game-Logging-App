class VideoGameDetails {
  final int id;
  final String title;
  final String posterUrl;
  final String releaseDate;
  final String summary;

  VideoGameDetails(
      {required this.id,
      required this.title,
      required this.posterUrl,
      required this.releaseDate,
      required this.summary});

  factory VideoGameDetails.fromJson(Map<String, dynamic> json) {
    return VideoGameDetails(
        id: json["id"],
        title: json["name"],
        posterUrl: 'http:$json["cover"]["url"]',
        releaseDate: json["release_dates"][0]["human"],
        summary: json["summary"]);
  }
}
