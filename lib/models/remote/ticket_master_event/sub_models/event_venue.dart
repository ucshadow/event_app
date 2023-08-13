class EventVenue {
  String? name;
  String? type;
  String? city;
  String? address;

  EventVenue({
    this.name,
    this.type,
    this.city,
    this.address,
  });

  factory EventVenue.fromJson(Map<dynamic, dynamic> json) {
    return EventVenue(
      name: json['name']?.toString(),
      type: json['type']?.toString(),
      city: json['city']?['name']?.toString(),
      address: json['address']?['line1']?.toString(),
    );
  }

  static List<EventVenue> fromJsonList(List<dynamic>? json) {
    if (json == null || json.isEmpty) {
      return [];
    }
    return json
        .map((dynamic e) =>
        EventVenue.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
