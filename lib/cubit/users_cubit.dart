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
            name: "abc",
            author: Author(id: 4, name: "David Baldacci", rating: 1),
            description: "fgxdjhvfjv",
          ),
          Book(
            id: 2,
            name: "qwe",
            author: Author(id: 1, name: "Elly Griffiths", rating: 4),
            description: "fgxdjhvfjv",
          ),
          Book(
            id: 3,
            name: "asd",
            author: Author(id: 10, name: "Karin Slaughter", rating: 3),
            description: "fgxdjhvfjv",
          ),
          Book(
            id: 4,
            name: "pqr",
            author: Author(id: 8, name: "Lucinda Riley", rating: 2),
            description: "fgxdjhvfjv",
          ),
        ],
      ),
      User(
        name: "Patrick",
        books: [
          Book(
            id: 5,
            name: "32132",
            author: Author(id: 4, name: "David Baldacci", rating: 1),
            description: "fgxdjhvfjv",
          ),
          Book(
            id: 6,
            name: "154",
            author: Author(id: 1, name: "Elly Griffiths", rating: 4),
            description: "fgxdjhvfjv",
          ),
          Book(
            id: 7,
            name: "85756",
            author: Author(id: 10, name: "Karin Slaughter", rating: 3),
            description: "fgxdjhvfjv",
          ),
          Book(
            id: 8,
            name: "78746",
            author: Author(id: 8, name: "Lucinda Riley", rating: 2),
            description: "fgxdjhvfjv",
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
    // final currentUser = state.currentUser;
    if (state.currentUser == null) return;
    final updatedUser = state.copywith(
      books: [...state.currentUser!.books, book],
    );
    emit(updatedUser);
  }
}
