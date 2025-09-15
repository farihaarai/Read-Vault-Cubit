import 'package:book_library_cubit/models/book.dart';
import 'package:book_library_cubit/models/user.dart';

class UsersState {
  final List<User> users;
  final User? currentUser;
  final String filter;
  final String query;
  final List<Book> books;

  const UsersState({
    this.users = const [],
    this.currentUser,
    this.filter = "all",
    this.query = "",
    this.books = const [],
  });

  UsersState copywith({
    List<User>? users,
    User? currentUser,
    String? filter,
    String? query,
    List<Book>? books,
  }) {
    return UsersState(
      users: users ?? this.users,
      currentUser: currentUser ?? this.currentUser,
      filter: filter ?? this.filter,
      query: query ?? this.query,
      books: books ?? this.books,
    );
  }

  @override
  String toString() {
    return 'UsersState(users: $users, currentUser: $currentUser, filter: $filter, query: $query, books: $books)';
  }
}
