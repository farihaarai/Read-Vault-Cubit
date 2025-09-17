// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authors_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthorsStateCWProxy {
  AuthorsState authors(List<Author> authors);

  AuthorsState selectedAuthorId(int? selectedAuthorId);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AuthorsState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AuthorsState(...).copyWith(id: 12, name: "My name")
  /// ```
  AuthorsState call({List<Author> authors, int? selectedAuthorId});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAuthorsState.copyWith(...)` or call `instanceOfAuthorsState.copyWith.fieldName(value)` for a single field.
class _$AuthorsStateCWProxyImpl implements _$AuthorsStateCWProxy {
  const _$AuthorsStateCWProxyImpl(this._value);

  final AuthorsState _value;

  @override
  AuthorsState authors(List<Author> authors) => call(authors: authors);

  @override
  AuthorsState selectedAuthorId(int? selectedAuthorId) =>
      call(selectedAuthorId: selectedAuthorId);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AuthorsState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AuthorsState(...).copyWith(id: 12, name: "My name")
  /// ```
  AuthorsState call({
    Object? authors = const $CopyWithPlaceholder(),
    Object? selectedAuthorId = const $CopyWithPlaceholder(),
  }) {
    return AuthorsState(
      authors: authors == const $CopyWithPlaceholder() || authors == null
          ? _value.authors
          // ignore: cast_nullable_to_non_nullable
          : authors as List<Author>,
      selectedAuthorId: selectedAuthorId == const $CopyWithPlaceholder()
          ? _value.selectedAuthorId
          // ignore: cast_nullable_to_non_nullable
          : selectedAuthorId as int?,
    );
  }
}

extension $AuthorsStateCopyWith on AuthorsState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAuthorsState.copyWith(...)` or `instanceOfAuthorsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthorsStateCWProxy get copyWith => _$AuthorsStateCWProxyImpl(this);
}
