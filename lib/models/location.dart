class Location {
  final String name;
  final String link;
  final String category; // 추가된 필드
  final String roadAddress; // 추가된 필드

  Location({
    required this.name,
    required this.link,
    required this.category,
    required this.roadAddress,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      link: json['link'],
      category: json['category'] ?? '', // 데이터가 없을 수 있으므로 기본값 설정
      roadAddress: json['roadAddress'] ?? '', // 데이터가 없을 수 있으므로 기본값 설정
    );
  }
}
