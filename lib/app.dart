import 'package:book_library_cubit/cubit/authors_cubit.dart';
import 'package:book_library_cubit/cubit/books_cubit.dart';
import 'package:book_library_cubit/cubit/users_cubit.dart';
import 'package:book_library_cubit/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookLibrary extends StatelessWidget {
  const BookLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthorsCubit()),
          BlocProvider(create: (_) => UsersCubit()),
          BlocProvider(create: (_) => BooksCubit()),
        ],
        child: HomeView(),
      ),
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
        useMaterial3: false,
      ),
    );
  }
}
