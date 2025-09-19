import 'package:book_library_cubit/cubit/authors_cubit.dart';
import 'package:book_library_cubit/models/states/authors_state.dart';
import 'package:book_library_cubit/cubit/users_cubit.dart';
import 'package:book_library_cubit/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddBook extends StatelessWidget {
  AddBook({super.key});

  final idController = TextEditingController();
  final nameController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authorCubit = context.read<AuthorsCubit>();
    final userCubit = context.read<UsersCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new Book"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: "Book ID",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.confirmation_number),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Book Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.book),
              ),
            ),

            const SizedBox(height: 15),

            BlocBuilder<AuthorsCubit, AuthorsState>(
              builder: (context, state) {
                return DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: "Select Author",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),
                  isExpanded: true,
                  value: state.selectedAuthorId == 0
                      ? null
                      : state.selectedAuthorId,
                  items: state.authors
                      .map(
                        (author) => DropdownMenuItem<int>(
                          value: author.id,
                          child: Text(author.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      context.read<AuthorsCubit>().selectAuthor(value);
                    }
                  },
                );
              },
            ),

            const SizedBox(height: 15),

            TextField(
              controller: descController,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.description),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (idController.text.isEmpty ||
                      nameController.text.isEmpty ||
                      authorCubit.state.selectedAuthorId == 0 ||
                      descController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          "Please fill all fields",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red[300],
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    return;
                  }
                  final selectedAuthor = authorCubit.state.authors.firstWhere(
                    (a) => a.id == authorCubit.state.selectedAuthorId,
                  );

                  final book = Book(
                    id: int.parse(idController.text),
                    name: nameController.text,
                    author: selectedAuthor,
                    description: descController.text,
                  );
                  userCubit.addBook(book);
                  context.go('/');
                },
                child: const Text(
                  "Add Book",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
