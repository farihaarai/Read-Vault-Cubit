// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BookCWProxy {
  Book id(int id);

  Book name(String name);

  Book author(Author author);

  Book description(String description);

  Book isFavorite(bool isFavorite);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `Book(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// Book(...).copyWith(id: 12, name: "My name")
  /// ```
  Book call({
    int id,
    String name,
    Author author,
    String description,
    bool isFavorite,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfBook.copyWith(...)` or call `instanceOfBook.copyWith.fieldName(value)` for a single field.
class _$BookCWProxyImpl implements _$BookCWProxy {
  const _$BookCWProxyImpl(this._value);

  final Book _value;

  @override
  Book id(int id) => call(id: id);

  @override
  Book name(String name) => call(name: name);

  @override
  Book author(Author author) => call(author: author);

  @override
  Book description(String description) => call(description: description);

  @override
  Book isFavorite(bool isFavorite) => call(isFavorite: isFavorite);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `Book(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// Book(...).copyWith(id: 12, name: "My name")
  /// ```
  Book call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? author = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? isFavorite = const $CopyWithPlaceholder(),
  }) {
    return Book(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      author: author == const $CopyWithPlaceholder() || author == null
          ? _value.author
          // ignore: cast_nullable_to_non_nullable
          : author as Author,
      description:
          description == const $CopyWithPlaceholder() || description == null
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
      isFavorite:
          isFavorite == const $CopyWithPlaceholder() || isFavorite == null
          ? _value.isFavorite
          // ignore: cast_nullable_to_non_nullable
          : isFavorite as bool,
    );
  }
}

extension $BookCopyWith on Book {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfBook.copyWith(...)` or `instanceOfBook.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BookCWProxy get copyWith => _$BookCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  author: Author.fromJson(json['author'] as Map<String, dynamic>),
  description: json['description'] as String,
  isFavorite: json['isFavorite'] as bool? ?? false,
);

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'author': instance.author,
  'description': instance.description,
  'isFavorite': instance.isFavorite,
};
