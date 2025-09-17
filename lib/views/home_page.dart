import 'package:book_library_cubit/cubit/users_cubit.dart';
import 'package:book_library_cubit/states/users_state.dart';
import 'package:book_library_cubit/views/add_book.dart';
import 'package:book_library_cubit/widgets/book_list.dart';
import 'package:book_library_cubit/widgets/filter_tabs.dart';
import 'package:book_library_cubit/widgets/user_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserTabs(),
            SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBook()),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text(
                "Add Book",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),

            // Filter Buttons
            FilterTabs(),
            SizedBox(height: 20),

            // Author Search
            BlocBuilder<UsersCubit, UsersState>(
              builder: (context, state) {
                if (state.filter == "author") {
                  return Card(
                    color: Colors.white.withOpacity(0.9),
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
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
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
                                context.read<UsersCubit>().getBooksByAuthor(
                                  query,
                                );
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
            ),

            Expanded(child: BookList()),
          ],
        ),
      ),
    );
  }
}
