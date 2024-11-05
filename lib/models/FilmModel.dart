import 'package:api_project/widgets/filmImages.dart';

class Film {
  final String title;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;
  final String imageUrl;

  Film({
    required this.title,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.imageUrl,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'],
      openingCrawl: json['opening_crawl'],
      director: json['director'],
      producer: json['producer'],
      releaseDate: json['release_date'],
      imageUrl: filmImages[json['title']] ?? '',
    );
  }
}
