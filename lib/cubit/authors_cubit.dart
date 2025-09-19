import 'package:book_library_cubit/models/states/authors_state.dart';
// import 'package:book_library_cubit/models/author.dart';
import 'package:book_library_cubit/network/client.dart';
// import 'package:book_library_cubit/network/rest_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsCubit extends Cubit<AuthorsState> {
  // final UsersCubit usersCubit;
  AuthorsCubit() : super(AuthorsState()) {
    loadAuthors();
    // final authors = [
    //   Author(id: 1, name: "Elly Griffiths", rating: 4),
    //   Author(id: 2, name: "James Patterson", rating: 2),
    //   Author(id: 3, name: "Lee Child", rating: 1),
    //   Author(id: 4, name: "David Baldacci", rating: 1),
    //   Author(id: 5, name: "LJ Ross", rating: 5),
    //   Author(id: 6, name: "Ann Cleeves", rating: 1),
    //   Author(id: 7, name: "Michael Connelly", rating: 4),
    //   Author(id: 8, name: "Lucinda Riley", rating: 2),
    //   Author(id: 9, name: "Peter James", rating: 3),
    //   Author(id: 10, name: "Karin Slaughter", rating: 3),
    // ];
    // emit(state.copyWith(authors: authors));
  }

  Future<void> loadAuthors() async {
    final authors = await client.getAuthors();
    emit(state.copyWith(authors: authors));
  }

  void selectAuthor(int id) {
    emit(state.copyWith(selectedAuthorId: id));
  }

  // List<Book> getBooksByAuthor(String query) {
  //   final currentUser = usersCubit.state.currentUser;
  //   if (currentUser == null) return [];

  //   return currentUser.books
  //       .where((b) => b.author.name.toLowerCase().contains(query.toLowerCase()))
  //       .toList();
  // }
}
