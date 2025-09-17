import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:book_library_cubit/models/author.dart';

part 'authors_state.g.dart';

@CopyWith()
class AuthorsState {
  final List<Author> authors;
  final int? selectedAuthorId;

  const AuthorsState({this.authors = const [], this.selectedAuthorId});

  @override
  String toString() {
    return 'AuthorsState(authors: $authors, selectedAuthorId: $selectedAuthorId)';
  }
}
