import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_library_cubit/models/book.dart';

class BooksCubit extends Cubit<List<Book>> {
  BooksCubit() : super(const []);

  // Load initial books
  void loadBooks(List<Book> books) {
    emit(books);
  }

  // Add a new book
  void addBook(Book book) {
    final updated = List<Book>.from(state)..add(book);
    emit(updated);
  }

  // Remove a book
  void removeBook(int bookId) {
    final updated = state.where((b) => b.id != bookId).toList();
    emit(updated);
  }

  // Toggle favorite
  void toggleFavorite(int bookId) {
    final updated = state.map((b) {
      if (b.id == bookId) {
        return b.copyWith(isFavorite: !b.isFavorite);
      }
      return b;
    }).toList();
    emit(updated);
  }

  // Get only favorite books
  List<Book> getFavoriteBooks() {
    return state.where((b) => b.isFavorite).toList();
  }

  // Filter books by author name
  List<Book> getBooksByAuthor(String authorName) {
    return state
        .where(
          (b) => b.author.name.toLowerCase().contains(authorName.toLowerCase()),
        )
        .toList();
  }
}
