import 'package:book_library_cubit/cubit/authors_cubit.dart';
import 'package:book_library_cubit/cubit/users_cubit.dart';
import 'package:book_library_cubit/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookLibrary extends StatelessWidget {
  const BookLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthorsCubit()),
        BlocProvider(create: (_) => UsersCubit()),
        // BlocProvider(create: (_) => BooksCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
          useMaterial3: false,
        ),
      ),
    );
  }
}
