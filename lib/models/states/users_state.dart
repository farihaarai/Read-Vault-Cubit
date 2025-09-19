import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:book_library_cubit/models/book.dart';
import 'package:book_library_cubit/models/enums/books_filters.dart';
import 'package:book_library_cubit/models/user.dart';

part 'users_state.g.dart';

@CopyWith()
class UsersState {
  final List<User> users;
  final User? currentUser;
  final BookListFilters filter;
  final String query;
  final List<Book> books;
  final List<Book> favBooks;

  const UsersState({
    this.users = const [],
    this.currentUser,
    this.filter = BookListFilters.all,
    this.query = "",
    this.books = const [],
    this.favBooks = const [],
  });

  @override
  String toString() {
    return 'UsersState(users: $users, currentUser: $currentUser, filter: $filter, query: $query, books: $books, favBooks: $favBooks)';
  }
}
