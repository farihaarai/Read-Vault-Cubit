import 'package:book_library_cubit/data.dart' as data;
import 'package:book_library_cubit/models/book.dart';
import 'package:book_library_cubit/models/enums/books_filters.dart';
import 'package:book_library_cubit/network/client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/states/users_state.dart';
import '../models/user.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit()
    : super(
        UsersState(users: data.getUsers(), currentUser: data.getUsers().first),
      ) {
    loadBooks(state.users.first);
  }

  void selectUser(User user) {
    emit(state.copyWith(currentUser: user));
    loadBooks(user);
    // loadFavoriteBooks();
  }

  void setFilter(String? filter) {
    BookListFilters f = BookListFilters.values.firstWhere(
      (element) => element.name == filter,
      orElse: () => BookListFilters.all,
    );
    emit(state.copyWith(filter: f));
    // emit(state.copywith(filter: filter, query: ''));
  }

  void setQuery(String query) {
    emit(state.copyWith(query: query));
  }

  // ------------------------ Book Management ------------------------ //

  Future<void> loadBooks(User user) async {
    final books = await client.getBooks(user.name);
    final updatedUser = user.copyWith(books: books);
    final updatedUsers = state.users
        .map((u) => u.name == updatedUser.name ? updatedUser : u)
        .toList();
    emit(state.copyWith(currentUser: updatedUser, users: updatedUsers));
    await loadFavoriteBooks();
  }

  Future<void> addBook(Book book) async {
    if (state.currentUser == null) return;
    final newBook = await client.addBook(state.currentUser!.name, {
      "name": book.name,
      "authorId": book.author.id,
      "description": book.description,
    });
    final updatedBooks = [...state.currentUser!.books, newBook];
    final updatedUser = state.currentUser!.copyWith(books: updatedBooks);
    final updatedUsers = state.users
        .map((u) => u.name == updatedUser.name ? updatedUser : u)
        .toList();
    emit(state.copyWith(currentUser: updatedUser, users: updatedUsers));
  }

  // void toggleFavorite(Book book) {
  //   if (state.currentUser == null) return;
  //   final updatedBooks = state.currentUser!.books.map((b) {
  //     if (b.id == book.id) {
  //       return b.copyWith(isFavorite: !b.isFavorite);
  //     }
  //     return b;
  //   }).toList();
  //   final updatedUser = state.currentUser!.copyWith(books: updatedBooks);
  //   final updatedUsers = state.users
  //       .map((u) => u.name == updatedUser.name ? updatedUser : u)
  //       .toList();
  //   emit(state.copyWith(currentUser: updatedUser, users: updatedUsers));
  // }
  Future<void> toggleFavorite(Book book) async {
    if (state.currentUser == null) return;

    await client.toggleFavorite(
      state.currentUser!.name,
      book.id,
      !book.isFavorite,
    );
    final updatedBooks = state.currentUser!.books.map((b) {
      if (b.id == book.id) {
        return b.copyWith(isFavorite: !b.isFavorite);
      }
      return b;
    }).toList();
    final updatedFavBooks = updatedBooks.where((b) => b.isFavorite).toList();

    final updatedUser = state.currentUser!.copyWith(
      books: updatedBooks,
      favBooks: updatedFavBooks,
    );

    final updatedUsers = state.users
        .map((u) => u.name == updatedUser.name ? updatedUser : u)
        .toList();
    emit(state.copyWith(currentUser: updatedUser, users: updatedUsers));
  }

  void deleteBook(Book book) async {
    if (state.currentUser == null) return;
    await client.deleteBook(state.currentUser!.name, book.id);
    final updatedBooks = state.currentUser!.books
        .where((b) => b.id != book.id)
        .toList();
    final updatedUser = state.currentUser!.copyWith(books: updatedBooks);
    final updatedUsers = state.users
        .map((u) => u.name == updatedUser.name ? updatedUser : u)
        .toList();
    emit(state.copyWith(currentUser: updatedUser, users: updatedUsers));
  }

  Future<void> loadFavoriteBooks() async {
    if (state.currentUser == null) return;
    final favBooks = await client.getFavBooks(state.currentUser!.name);
    final updatedBooks = state.currentUser!.books.map((b) {
      final isFav = favBooks.any((fav) => fav.id == b.id);
      return b.copyWith(isFavorite: isFav);
    }).toList();

    final updatedUser = state.currentUser!.copyWith(
      books: updatedBooks,
      favBooks: favBooks,
    );
    final updatedUsers = state.users
        .map((u) => u.name == updatedUser.name ? updatedUser : u)
        .toList();
    emit(state.copyWith(currentUser: updatedUser, users: updatedUsers));
  }

  List<Book> getFilteredBooks() {
    if (state.currentUser == null) return [];
    List<Book> list = state.currentUser!.books;

    if (state.filter == BookListFilters.favorite) {
      return list.where((b) => b.isFavorite).toList();
      // List<Book> favbooks = list.where((b) => b.isFavorite).toList();
      // return favbooks;
      // loadFavBooks();
    }
    if (state.filter == BookListFilters.author && state.query.isNotEmpty) {
      return list
          .where(
            (b) =>
                b.author.name.toLowerCase().contains(state.query.toLowerCase()),
          )
          .toList();
    }
    return list;
  }

  // ------------------------ Author Search ------------------------ //
  List<Book> getBooksByAuthor(String authorName) {
    if (state.currentUser == null) return [];

    return state.currentUser!.books
        .where(
          (b) => b.author.name.toLowerCase().contains(authorName.toLowerCase()),
        )
        .toList();
  }
}
