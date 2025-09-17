// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UsersStateCWProxy {
  UsersState users(List<User> users);

  UsersState currentUser(User? currentUser);

  UsersState filter(BookListFilters filter);

  UsersState query(String query);

  UsersState books(List<Book> books);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UsersState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UsersState(...).copyWith(id: 12, name: "My name")
  /// ```
  UsersState call({
    List<User> users,
    User? currentUser,
    BookListFilters filter,
    String query,
    List<Book> books,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUsersState.copyWith(...)` or call `instanceOfUsersState.copyWith.fieldName(value)` for a single field.
class _$UsersStateCWProxyImpl implements _$UsersStateCWProxy {
  const _$UsersStateCWProxyImpl(this._value);

  final UsersState _value;

  @override
  UsersState users(List<User> users) => call(users: users);

  @override
  UsersState currentUser(User? currentUser) => call(currentUser: currentUser);

  @override
  UsersState filter(BookListFilters filter) => call(filter: filter);

  @override
  UsersState query(String query) => call(query: query);

  @override
  UsersState books(List<Book> books) => call(books: books);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UsersState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UsersState(...).copyWith(id: 12, name: "My name")
  /// ```
  UsersState call({
    Object? users = const $CopyWithPlaceholder(),
    Object? currentUser = const $CopyWithPlaceholder(),
    Object? filter = const $CopyWithPlaceholder(),
    Object? query = const $CopyWithPlaceholder(),
    Object? books = const $CopyWithPlaceholder(),
  }) {
    return UsersState(
      users: users == const $CopyWithPlaceholder() || users == null
          ? _value.users
          // ignore: cast_nullable_to_non_nullable
          : users as List<User>,
      currentUser: currentUser == const $CopyWithPlaceholder()
          ? _value.currentUser
          // ignore: cast_nullable_to_non_nullable
          : currentUser as User?,
      filter: filter == const $CopyWithPlaceholder() || filter == null
          ? _value.filter
          // ignore: cast_nullable_to_non_nullable
          : filter as BookListFilters,
      query: query == const $CopyWithPlaceholder() || query == null
          ? _value.query
          // ignore: cast_nullable_to_non_nullable
          : query as String,
      books: books == const $CopyWithPlaceholder() || books == null
          ? _value.books
          // ignore: cast_nullable_to_non_nullable
          : books as List<Book>,
    );
  }
}

extension $UsersStateCopyWith on UsersState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUsersState.copyWith(...)` or `instanceOfUsersState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UsersStateCWProxy get copyWith => _$UsersStateCWProxyImpl(this);
}
