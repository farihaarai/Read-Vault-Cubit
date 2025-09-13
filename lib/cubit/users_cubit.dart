import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_library_cubit/models/user.dart';
import 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(const UsersState());

  void loadUsers(List<String> names) {
    final users = names.map((name) => User(name: name, books: [])).toList();
    emit(
      state.copyWith(
        users: users,
        currentUser: users.isNotEmpty ? users.first : null,
      ),
    );
  }

  void selectUser(User user) {
    emit(state.copyWith(currentUser: user));
  }

  void setFilter(String filter) {
    emit(state.copyWith(filter: filter));
  }

  void setQuery(String query) {
    emit(state.copyWith(query: query));
  }
}
