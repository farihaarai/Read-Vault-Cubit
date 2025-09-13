import 'package:book_library_cubit/models/user.dart';

class UsersState {
  final List<User> users;
  final User? currentUser;
  final String filter; // all / author / favorite
  final String query;

  const UsersState({
    this.users = const [],
    this.currentUser,
    this.filter = 'all',
    this.query = '',
  });

  UsersState copyWith({
    List<User>? users,
    User? currentUser,
    String? filter,
    String? query,
  }) {
    return UsersState(
      users: users ?? this.users,
      currentUser: currentUser ?? this.currentUser,
      filter: filter ?? this.filter,
      query: query ?? this.query,
    );
  }
}
