class EventImage {
  String url;

  EventImage({
    required this.url,
  });

  factory EventImage.fromJson(Map<dynamic, dynamic>? json) {
    return EventImage(url: json!['url']);
  }

  static List<EventImage> fromJsonList(List<dynamic>? json) {
    if (json == null || json.isEmpty) {
      return [];
    }
    return json
        .map((dynamic e) => EventImage.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
