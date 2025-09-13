import 'package:book_library_cubit/models/author.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsCubit extends Cubit<List<Author>> {
  AuthorsCubit() : super([]);

  Author? selectedAuthor;

  void loadAuthors(List<Author> authors) {
    emit(authors);

    if (authors.isNotEmpty) {
      selectedAuthor = authors.first;
    }
  }

  void selectAuthor(Author author) {
    selectedAuthor = author;
  }
}
