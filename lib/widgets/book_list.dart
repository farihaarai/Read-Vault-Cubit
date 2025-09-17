import 'package:book_library_cubit/cubit/users_cubit.dart';
import 'package:book_library_cubit/states/users_state.dart';
import 'package:book_library_cubit/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UsersCubit>();
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        final List<Book> books = userCubit.getFilteredBooks();
        if (books.isEmpty) {
          return Center(
            child: Text(
              "No Books Found.",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              Book book = books[index];
              return Card(
                child: ListTile(
                  title: Text(book.name),
                  subtitle: Text(book.author.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          userCubit.toggleFavorite(book);
                        },
                        icon: Icon(
                          book.isFavorite ? Icons.star : Icons.star_border,
                          color: Colors.yellow,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          userCubit.deleteBook(book);
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
