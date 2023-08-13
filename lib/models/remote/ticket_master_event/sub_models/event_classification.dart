class EventClassification {
  bool? primary;

  /// True if this is a family classification - probably rating?
  bool? family;

  /// Event segment, ex: Music
  String? segment;

  /// ex: Theatre
  String? genre;

  /// ex: Musical
  String? subGenre;

  EventClassification({
    this.primary,
    this.family,
    this.segment,
    this.genre,
    this.subGenre,
  });

  factory EventClassification.fromJson(Map<dynamic, dynamic>? json) {
    if (json == null) {
      return EventClassification();
    }
    return EventClassification(
      primary: json['primary'].toString() == 'true',
      family: json['family'].toString() == 'true',
      segment: json['segment']?['name']?.toString(),
      genre: json['genre']?['name']?.toString(),
      subGenre: json['subGenre']?['name']?.toString(),
    );
  }

  static List<EventClassification> fromJsonList(List<dynamic>? json) {
    if (json == null || json.isEmpty) {
      return [];
    }
    return json
        .map((dynamic e) =>
            EventClassification.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
