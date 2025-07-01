class HarryBook {
  String? id;
  Attributes? attributes;
  // https://api.potterdb.com/v1/books
  HarryBook({this.id, this.attributes});

  factory HarryBook.fromJson(Map<String, dynamic> json) {
    return HarryBook(
      id: json['id'],
      attributes: Attributes.fromJson(
        json['attributes'] as Map<String, dynamic>,
      ),
    );
  }
}

class Attributes {
  final String? author;
  final String? cover;
  final String? dedication;
  final int? pages;
  final String? releaseDate;
  final String? summary;
  final String? title;
  final String? wiki;

  Attributes({
    this.author,
    this.cover,
    this.dedication,
    this.pages,
    this.releaseDate,
    this.summary,
    this.title,
    this.wiki,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      author: json['author'],
      cover: json['cover'],
      dedication: json['dedication'],
      pages: json['pages'],
      releaseDate: json['release_date'],
      summary: json['summary'],
      title: json['title'],
      wiki: json['wiki'],
    );
  }
}
