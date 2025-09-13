import 'package:book_library_cubit/app.dart';
import 'package:book_library_cubit/app_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = const AppObserver();
  runApp(const BookLibrary());
}
