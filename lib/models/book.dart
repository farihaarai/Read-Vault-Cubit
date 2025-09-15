import 'dart:convert';

import 'package:book_library_cubit/models/author.dart';

class Book {
  final int id;
  final String name;
  final Author author;
  final String description;
  final bool isFavorite;

  const Book({
    required this.id,
    required this.name,
    required this.author,
    required this.description,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'author': author.toJson(),
    'description': description,
    'isFavorite': isFavorite,
  };

  @override
  String toString() => jsonEncode(toJson());
}
