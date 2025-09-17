import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/users_cubit.dart';
import '../states/users_state.dart';

class UserTabs extends StatelessWidget {
  const UserTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        final users = state.users;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: users.map((u) {
            bool isActive = state.currentUser?.name == u.name;

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
                  context.read<UsersCubit>().selectUser(u);
                },
                child: Text(u.name.toUpperCase()),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
