class EventDates {
  EventDateTime? start;
  EventDateTime? end;

  EventDates({
    this.start,
    this.end,
  });

  factory EventDates.fromJson(Map<dynamic, dynamic> json) {
    return EventDates(
      end: EventDateTime.fromJson(json['end']),
      start: EventDateTime.fromJson(json['start']),
    );
  }

  static DateTime? asDate(EventDateTime? dateTime) {
    if(dateTime == null) {
      return null;
    }
    if(dateTime.localDate == null) {
      return null;
    }
    return DateTime.parse(dateTime.localDate!);
  }
}

class EventDateTime {
  String? localDate;
  String? localTime;

  EventDateTime({
    this.localDate,
    this.localTime,
  });

  factory EventDateTime.fromJson(Map<dynamic, dynamic>? json) {
    if(json == null) {
      return EventDateTime();
    }
    return EventDateTime(
      localDate: json['localDate'],
      localTime: json['localTime'],
    );
  }
}
