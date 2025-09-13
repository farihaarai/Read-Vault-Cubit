import 'package:book_library_cubit/widgets/filter_tabs.dart';
import 'package:book_library_cubit/widgets/user_tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [UserTabs(), SizedBox(height: 10), FilterTabs()],
        ),
      ),
    );
  }
}
