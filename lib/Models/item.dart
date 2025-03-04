class Item {
  final String name;
  final String email;
  final String gender;
  final int height;
  final int weight;

  Item(
      {required this.name,
      required this.email,
      required this.gender,
      required this.height,
      required this.weight});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      height: json['height'],
      weight: json['weight'],
    );
  }
}
