import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'author.g.dart';

@JsonSerializable()
@CopyWith()
class Author {
  final int id;
  final String name;
  final int rating;

  const Author({required this.id, required this.name, required this.rating});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
