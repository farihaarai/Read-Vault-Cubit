import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/users_cubit.dart';
import '../cubit/users_state.dart';

class FilterTabs extends StatelessWidget {
  const FilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        final filters = ["all", "author", "favorite"];

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: filters.map((f) {
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
                onPressed: () {
                  context.read<UsersCubit>().setFilter(f);
                },
                child: Text(f.toUpperCase()),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
