class EventPromoter {
  String? name;
  String? description;

  EventPromoter({
    this.name,
    this.description,
  });

  factory EventPromoter.fromJson(Map<dynamic, dynamic>? json) {
    if(json == null) {
      return EventPromoter();
    }
    return EventPromoter(
      name: json['name']?.toString(),
      description: json['description']?.toString(),
    );
  }

  static List<EventPromoter> fromJsonList(List<dynamic>? json) {
    if (json == null || json.isEmpty) {
      return [];
    }
    return json
        .map((dynamic e) =>
        EventPromoter.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}