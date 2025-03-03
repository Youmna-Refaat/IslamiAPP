class ReciterModel {
  final int id;
  final String name;
  final List<Map<String, dynamic>> moshaf;

  ReciterModel({
    required this.id,
    required this.name,
    required this.moshaf,
  });

  factory ReciterModel.fromJson(Map<String, dynamic> json) {
    return ReciterModel(
      id: json['id'],
      name: json['name'],
      moshaf: List<Map<String, dynamic>>.from(json['moshaf']),
    );
  }
}
