class HarryMovies {
  String id;
  Attributes attributes;
// https://api.potterdb.com/v1/movies
  HarryMovies({required this.id, required this.attributes});

  factory HarryMovies.fromJson(Map<String, dynamic> json) {
    return HarryMovies(
      id: json["id"],
      attributes: Attributes.fromJson(
        json['attributes'] as Map<String, dynamic>,
      ),
    );
  }
}

class Attributes {
  // Use 'final' for immutability where possible, and '?' for nullable fields
  final String? budget;
  final List<String> cinematographers; // Often an empty list if not present, not null
  final List<String> directors;
  final List<String> distributors;
  final List<String> editors;
  final List<String> musicComposers;
  final String? cover;
  final List<String> producers;
  final DateTime? releaseDate; // Correctly parse to DateTime
  final String? runningTime;
  final String? summary;
  final String? title; // Assuming title could be missing, otherwise 'final String title'
  final String? trailer;

  const Attributes({
    this.budget,
    this.cinematographers = const [], // Default to empty list
    this.directors = const [],
    this.distributors = const [],
    this.editors = const [],
    this.musicComposers = const [],
    this.cover,
    this.producers = const [],
    this.releaseDate,
    this.runningTime,
    this.summary,
    this.title,
    this.trailer,
  });
  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      // Cast nullable strings, using 'as String?'
      budget: json["budget"] as String?,
      cover: json["poster"] as String?,
      runningTime:
          json["running_time"]
              as String?, // Note: using snake_case for consistency with previous example
      summary: json["summary"] as String?,
      title: json["title"] as String?,
      trailer: json["trailer"] as String?,

      // For lists, robustly handle nulls and ensure elements are strings
      cinematographers: List<String>.from(
        json["cinematographers"] as List? ?? [],
      ),
      directors: List<String>.from(json["directors"] as List? ?? []),
      distributors: List<String>.from(json["distributors"] as List? ?? []),
      editors: List<String>.from(json["editors"] as List? ?? []),
      musicComposers: List<String>.from(json["music_composers"] as List? ?? []),
      producers: List<String>.from(json["producers"] as List? ?? []),

      // Parsing DateTime from a string
      releaseDate:
          json["release_date"] != null
              ? DateTime.tryParse(json["release_date"] as String)
              : null,
    );
  }
}
