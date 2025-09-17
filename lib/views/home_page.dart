import 'package:book_library_cubit/cubit/users_cubit.dart';
import 'package:book_library_cubit/models/enums/books_filters.dart';
import 'package:book_library_cubit/models/states/users_state.dart';
import 'package:book_library_cubit/widgets/book_list.dart';
import 'package:book_library_cubit/widgets/filter_tabs.dart';
import 'package:book_library_cubit/widgets/user_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.filter});
  final String? filter;

  final TextEditingController queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<UsersCubit>().setFilter(filter);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Users Section
            UserTabs(),
            SizedBox(height: 10),

            // Add New Book Section
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                context.go('/addBook');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AddBook()),
                // );
              },
              icon: const Icon(Icons.add),
              label: const Text(
                "Add Book",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),

            // Filters Section
            FilterTabs(),
            SizedBox(height: 20),

            // Author Search Section
            _authorSearch(),

            // Book List Section
            Expanded(child: BookList()),
          ],
        ),
      ),
    );
  }

  Widget _authorSearch() {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state.filter == BookListFilters.author) {
          return Card(
            color: Colors.white.withValues(alpha: 0.9),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: queryController,
                      decoration: const InputDecoration(
                        hintText: "Search by author",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[700],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                    ),
                    onPressed: () {
                      final query = queryController.text.trim();
                      if (query.isNotEmpty) {
                        context.read<UsersCubit>().getBooksByAuthor(query);
                        context.read<UsersCubit>().setQuery(query);
                      }
                      // queryController.clear();
                    },
                    child: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
