import 'sub_models/event_classification.dart';
import 'sub_models/event_dates.dart';
import 'sub_models/event_image.dart';
import 'sub_models/event_promoter.dart';
import 'sub_models/event_sales.dart';
import 'sub_models/event_venue.dart';

/// An event as represented by the Ticket master API.
/// Given the time constrains, only the important data will be parsed
class TMEvent {
  /// ageRestrictions['legalAgeEnforced']. Could be skipped in the payload
  bool? over18;

  String name;
  String type;
  String id;
  String url;

  EventSales sales;

  EventDates dates;

  EventPromoter promoter;

  List<EventClassification> classifications = [];

  List<EventImage> images = [];

  List<EventPromoter> promoters = [];

  /// _embedded['venues']
  List<EventVenue> venues = [];

  TMEvent({
    this.over18,
    required this.name,
    required this.type,
    required this.id,
    required this.url,
    required this.images,
    required this.sales,
    required this.dates,
    required this.classifications,
    required this.promoter,
    required this.promoters,
    required this.venues,
  });

  factory TMEvent.fromJson(Map<dynamic, dynamic> json) {
    return TMEvent(
      over18:
          json['ageRestrictions']?['legalAgeEnforced']?.toString() == 'true',
      name: json['name'].toString(),
      type: json['type'].toString(),
      url: json['url'].toString(),
      images: EventImage.fromJsonList((json['images'] ?? []) as List<dynamic>),
      classifications: EventClassification.fromJsonList(
          (json['classifications'] ?? []) as List<dynamic>),
      promoters: EventPromoter.fromJsonList(
          (json['promoters'] ?? []) as List<dynamic>),
      venues: EventVenue.fromJsonList(
          (json['_embedded']?['venues'] ?? []) as List<dynamic>),
      id: json['id'].toString(),
      dates: EventDates.fromJson(json['dates'] as Map<dynamic, dynamic>),
      promoter: EventPromoter.fromJson(
          (json['promoter'] ?? {}) as Map<dynamic, dynamic>),
      sales: EventSales.fromJson(json['sales'] as Map<dynamic, dynamic>),
    );
  }

  static List<TMEvent> fromJsonList(List<dynamic>? json) {
    if (json == null || json.isEmpty) {
      return [];
    }
    return json
        .map((dynamic e) => TMEvent.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  String toString() {
    return 'TMEvent{over18: $over18, name: $name, type: $type, id: $id, url: $url}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TMEvent && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
