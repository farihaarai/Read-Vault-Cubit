import 'dart:convert';

class Author {
  final int id;
  final String name;
  final int rating;

  const Author({required this.id, required this.name, required this.rating});

  Author copyWith({int? id, String? name, int? rating}) {
    return Author(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'rating': rating};

  @override
  String toString() => jsonEncode(toJson());
}
