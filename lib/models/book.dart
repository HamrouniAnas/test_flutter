class Book {
  final String id;
  final String title;
  final String subtitle;
  final String authors;
  final String image;
  final String url;
  final String? description;
  final String? publisher;
  final String? pages;
  final String? year;
  final String? download;

  Book({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.image,
    required this.url,
    this.description,
    this.publisher,
    this.pages,
    this.year,
    this.download,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'] ?? '',
      authors: json['authors'],
      image: json['image'],
      url: json['url'],
      description: json['description'],
      publisher: json['publisher'],
      pages: json['pages'],
      year: json['year'],
      download: json['download'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'image': image,
      'url': url,
      'description': description,
      'publisher': publisher,
      'pages': pages,
      'year': year,
      'download': download,
    };
  }
}