/// Event image.
/// Not quite sure how to handle the filtering, as most of them seem to be
/// the same image but with different aspect ratio, but no other info provided
/// so I will just show all of them
/// I could, in theory just get the biggest image and roll with that
class EventImage {
  String url;

  EventImage({
    required this.url,
  });

  factory EventImage.fromJson(Map<dynamic, dynamic>? json) {
    return EventImage(url: json!['url'].toString());
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
