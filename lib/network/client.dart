import 'package:book_library_cubit/network/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

final logger = Logger();
final dio = Dio(); // Provide a dio instance
final client = RestClient(dio);
