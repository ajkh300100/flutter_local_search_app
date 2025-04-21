class Location {
  final String name;
  final String link;

  Location({required this.name, required this.link});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      link: json['link'],
    );
  }
}
