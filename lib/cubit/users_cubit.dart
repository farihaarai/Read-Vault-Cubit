import 'package:book_library_cubit/models/author.dart';
import 'package:book_library_cubit/models/book.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'users_state.dart';
import '../models/user.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersState()) {
    final users = [
      User(
        name: "Akshada",
        books: [
          Book(
            id: 1,
            name: "The Last Mile",
            author: Author(id: 4, name: "David Baldacci", rating: 1),
            description:
                "An Amos Decker thriller about memory, murder, and justice.",
          ),
          Book(
            id: 2,
            name: "The Night Hawks",
            author: Author(id: 1, name: "Elly Griffiths", rating: 4),
            description:
                "A Ruth Galloway mystery involving an archaeological dig and a murder.",
          ),
          Book(
            id: 3,
            name: "Pretty Girls",
            author: Author(id: 10, name: "Karin Slaughter", rating: 3),
            description:
                "A psychological thriller that unravels dark family secrets.",
          ),
          Book(
            id: 4,
            name: "The Seven Sisters",
            author: Author(id: 8, name: "Lucinda Riley", rating: 2),
            description:
                "The first book in the epic Seven Sisters series about love and family.",
          ),
        ],
      ),
      User(
        name: "Patrick",
        books: [
          Book(
            id: 5,
            name: "Memory Man",
            author: Author(id: 4, name: "David Baldacci", rating: 1),
            description:
                "The first Amos Decker novel about a detective who never forgets.",
          ),
          Book(
            id: 6,
            name: "The Lantern Men",
            author: Author(id: 1, name: "Elly Griffiths", rating: 4),
            description:
                "A Ruth Galloway mystery tied to folklore and serial killings.",
          ),
          Book(
            id: 7,
            name: "The Good Daughter",
            author: Author(id: 10, name: "Karin Slaughter", rating: 3),
            description:
                "A powerful story of two sisters bound by a violent tragedy.",
          ),
          Book(
            id: 8,
            name: "The Shadow Sister",
            author: Author(id: 8, name: "Lucinda Riley", rating: 2),
            description:
                "The third book in the Seven Sisters series about family and secrets.",
          ),
        ],
      ),
    ];

    emit(state.copywith(users: users, currentUser: users.first));
  }

  void selectUser(User user) {
    emit(state.copywith(currentUser: user));
  }

  void setFilter(String filter) {
    emit(state.copywith(filter: filter));
  }

  void setQuery(String query) {
    emit(state.copywith(query: query));
  }

  // ------------------------ Book Management ------------------------ //

  void addBook(Book book) {
    if (state.currentUser == null) return;
    final updatedBooks = [...state.currentUser!.books, book];
    final updatedUser = state.currentUser!.copywith(books: updatedBooks);
    final updatedUsers = state.users
        .map((u) => u.name == updatedUser.name ? updatedUser : u)
        .toList();
    emit(state.copywith(currentUser: updatedUser, users: updatedUsers));
  }

  void toggleFavorite(Book book) {
    if (state.currentUser == null) return;
    final updatedBooks = state.currentUser!.books.map((b) {
      if (b.id == book.id) {
        return b.copywith(isFavorite: !b.isFavorite);
      }
      return b;
    }).toList();
    final updatedUser = state.currentUser!.copywith(books: updatedBooks);
    final updatedUsers = state.users
        .map((u) => u.name == updatedUser.name ? updatedUser : u)
        .toList();
    emit(state.copywith(currentUser: updatedUser, users: updatedUsers));
  }

  void deleteBook(Book book) {
    if (state.currentUser == null) return;
    final updatedBooks = state.currentUser!.books
        .where((b) => b.id != book.id)
        .toList();
    final updatedUser = state.currentUser!.copywith(books: updatedBooks);
    final updatedUsers = state.users
        .map((u) => u.name == updatedUser.name ? updatedUser : u)
        .toList();
    emit(state.copywith(currentUser: updatedUser, users: updatedUsers));
  }

  List<Book> getFavBoooks() {
    if (state.currentUser == null) return [];
    return state.currentUser!.books.where((b) => b.isFavorite).toList();
  }

  List<Book> getFilteredBooks() {
    if (state.currentUser == null) return [];
    List<Book> list = state.currentUser!.books;

    if (state.filter == "favorite") {
      return list.where((b) => b.isFavorite).toList();
    }
    if (state.filter == "author" && state.query.isNotEmpty) {
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
