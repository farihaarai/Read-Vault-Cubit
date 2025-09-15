import 'package:book_library_cubit/cubit/books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksState()) {}
}
