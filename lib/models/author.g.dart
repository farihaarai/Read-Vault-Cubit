// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthorCWProxy {
  Author id(int id);

  Author name(String name);

  Author rating(int rating);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `Author(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// Author(...).copyWith(id: 12, name: "My name")
  /// ```
  Author call({int id, String name, int rating});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAuthor.copyWith(...)` or call `instanceOfAuthor.copyWith.fieldName(value)` for a single field.
class _$AuthorCWProxyImpl implements _$AuthorCWProxy {
  const _$AuthorCWProxyImpl(this._value);

  final Author _value;

  @override
  Author id(int id) => call(id: id);

  @override
  Author name(String name) => call(name: name);

  @override
  Author rating(int rating) => call(rating: rating);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `Author(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// Author(...).copyWith(id: 12, name: "My name")
  /// ```
  Author call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? rating = const $CopyWithPlaceholder(),
  }) {
    return Author(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      rating: rating == const $CopyWithPlaceholder() || rating == null
          ? _value.rating
          // ignore: cast_nullable_to_non_nullable
          : rating as int,
    );
  }
}

extension $AuthorCopyWith on Author {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAuthor.copyWith(...)` or `instanceOfAuthor.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthorCWProxy get copyWith => _$AuthorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  rating: (json['rating'] as num).toInt(),
);

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'rating': instance.rating,
};
