import 'package:book_library_cubit/models/book.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  BookList({super.key});

  final List<Book> books = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Book book = books[index];
      },
    );
  }
}
