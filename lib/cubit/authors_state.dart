import 'package:book_library_cubit/models/author.dart';

class AuthorsState {
  final List<Author> authors;
  final int? selectedAuthorId;

  const AuthorsState({this.authors = const [], this.selectedAuthorId});

  AuthorsState copyWith({List<Author>? authors, int? selectedAuthorId}) {
    return AuthorsState(
      authors: authors ?? this.authors,
      selectedAuthorId: selectedAuthorId ?? this.selectedAuthorId,
    );
  }

  @override
  String toString() {
    return 'AuthorsState(authors: $authors, selectedAuthorId: $selectedAuthorId)';
  }
}
