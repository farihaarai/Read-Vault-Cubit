import 'package:book_library_cubit/models/book.dart';

class BooksState {
  final List<Book> books;

  const BooksState({this.books = const []});

  BooksState copywith({List<Book>? books}) {
    return BooksState(books: books ?? this.books);
  }
}
