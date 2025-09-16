import 'dart:convert';

import 'package:book_library_cubit/models/book.dart';

class User {
  final String name;
  final List<Book> books;

  const User({required this.name, required this.books});

  User copywith({String? name, List<Book>? books}) {
    return User(name: name ?? this.name, books: books ?? this.books);
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'books': books.map((b) => b.toJson()).toList(),
  };

  @override
  String toString() => jsonEncode(toJson());
}
