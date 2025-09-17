import 'package:book_library_cubit/models/author.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'book.g.dart';

@JsonSerializable()
@CopyWith()
class Book {
  final int id;
  final String name;
  final Author author;
  final String description;
  final bool isFavorite;

  const Book({
    required this.id,
    required this.name,
    required this.author,
    required this.description,
    this.isFavorite = false,
  });
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
