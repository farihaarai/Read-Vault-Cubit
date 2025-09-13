import 'package:book_library_cubit/models/author.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsCubit extends Cubit<List<Author>> {
  AuthorsCubit() : super([]);

  void loadAuthors() {}
}
