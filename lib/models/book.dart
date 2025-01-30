class Book {
  final String id;
  final String title;
  final String author;
  final String image;
  final String description;
  final String url;
  final String subtitle;
  final String download;
  final String pages;
  final String year;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.image,
    required this.description,
    required this.url,
    required this.subtitle,
    required this.download,
    required this.pages,
    required this.year,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['authors'],
      image: json['image'],
      description: json['description'] ?? 'No description available',
      url: json['url'],
      subtitle: json['subtitle'],
      download: json['download'],
      pages: json['pages'],
      year: json['year'],
    );
  }
}