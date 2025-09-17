import 'package:book_library_cubit/views/add_book.dart';
import 'package:book_library_cubit/views/home_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        // get filter from query param
        final String? filter = state.uri.queryParameters['filter'];
        return HomePage(filter: filter);
      },
    ),
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) {
    //     return HomePage(filter: 'all');
    //   },
    // ),
    // GoRoute(
    //   path: '/:filter', //
    //   builder: (context, state) {
    //     final filter = state.pathParameters['filter'] ?? 'all';
    //     return HomePage(filter: filter);
    //   },
    // ),
    GoRoute(
      path: '/addBook',
      builder: (context, state) {
        return AddBook();
      },
    ),
  ],
);
