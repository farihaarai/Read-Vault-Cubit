import 'package:book_library_cubit/models/enums/books_filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubit/users_cubit.dart';
import '../models/states/users_state.dart';

class FilterTabs extends StatelessWidget {
  const FilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        final List<BookListFilters> filters = BookListFilters.values;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: filters.map((BookListFilters f) {
            bool isActive = state.filter == f;

            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isActive
                      ? const Color.fromARGB(255, 97, 111, 189)
                      : Colors.white,
                  foregroundColor: isActive ? Colors.white : Colors.indigo,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                // onPressed: () {
                //   if (f == 'all') {
                //     context.go('/');
                //   } else {
                //     context.go('/$f');
                //   }
                //   context.read<UsersCubit>().setFilter(f);
                // },
                onPressed: () {
                  final uri = Uri(
                    path: '/',
                    queryParameters: f != BookListFilters.all
                        ? {'filter': f.name}
                        : null,
                  );
                  context.go(uri.toString());
                },
                child: Text(f.name.toUpperCase()),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
