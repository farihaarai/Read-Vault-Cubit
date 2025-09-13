import 'dart:convert';
import 'package:book_library_cubit/models/book.dart';

class User {
  final String name;
  final List<Book> books;

  const User({required this.name, required this.books});

  User copyWith({String? name, List<Book>? books}) {
    return User(name: name ?? this.name, books: books ?? this.books);
  }

  @override
  String toString() {
    return jsonEncode({
      'name': name,
      'books': books.map((book) => book.toString()).toList(),
    });
  }
}
