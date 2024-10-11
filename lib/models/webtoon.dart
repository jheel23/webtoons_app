class Webtoon {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final String genre;
  final String description;
  double rating;
  bool favorite;

  Webtoon({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.genre,
    required this.description,
    required this.rating,
    required this.favorite,
  });

  factory Webtoon.fromJson(Map<String, dynamic> json) {
    return Webtoon(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      imageUrl: json['imageurl'],
      genre: json['genre'],
      description: json['description'],
      rating: json['rating'],
      favorite: json['isFavorite'] == 1 ? true : false,
    );
  }

  static Map<String, dynamic> toMap(Webtoon webtoon) {
    return {
      'id': webtoon.id,
      'title': webtoon.title,
      'author': webtoon.author,
      'imageurl': webtoon.imageUrl,
      'genre': webtoon.genre,
      'description': webtoon.description,
      'rating': webtoon.rating,
      'isFavorite': webtoon.favorite ? 1 : 0,
    };
  }
}
