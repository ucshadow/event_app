/// There is one 'Undefined' category, that's actually a category, not an error
/// id	"KZFzniwnSyZfZ7v7nl"
/// name	"Undefined"
/// locale	"en-us"
/// primaryId	"dataAdmin-segment-00000000000003ef"
class TMCategory {
  /// Over 18?
  bool family;

  String name;

  String id;

  TMCategory({
    required this.family,
    required this.name,
    required this.id,
  });

  factory TMCategory.fromJson(Map<dynamic, dynamic> json) {
    return TMCategory(
      family: json['family'].toString() == 'true',
      name: json['segment']['name'].toString(),
      id: json['segment']['id'].toString(),
    );
  }

  static List<TMCategory> fromJsonList(List<dynamic>? json) {
    if (json == null || json.isEmpty) {
      return [];
    }
    final List<TMCategory> res = [];
    for(final dynamic e in json) {
      final Map<String, dynamic> asMap = e as Map<String, dynamic>;
      if(asMap['segment'] == null) {
        // the TM api has categories and other stuff mixed up
        // (like parking and transportation) so we need to filter them
        continue;
      }
      res.add(TMCategory.fromJson(asMap));
    }
    return res;
  }

  static TMCategory empty() {
    return TMCategory(family: true, name: 'All genres', id: '1');
  }

  @override
  String toString() {
    return name;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TMCategory && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
