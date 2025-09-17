import 'package:book_library_cubit/models/book.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'user.g.dart';

@JsonSerializable()
@CopyWith()
class User {
  final String name;
  final List<Book> books;

  const User({required this.name, required this.books});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
