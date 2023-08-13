class EventSales {
  DateTime? startDateTime;
  DateTime? endDateTime;

  EventSales({
    required this.startDateTime,
    required this.endDateTime,
  });

  factory EventSales.fromJson(Map<dynamic, dynamic> json) {
    return EventSales(
      startDateTime: json['startDateTime'].toString() != null.toString()
          ? DateTime.parse(json['startDateTime'].toString()).toLocal()
          : null,
      endDateTime: json['endDateTime'].toString() != null.toString()
          ? DateTime.parse(json['endDateTime'].toString()).toLocal()
          : null,
    );
  }
}
