import 'package:book_library_cubit/models/author.dart';
import 'package:book_library_cubit/models/book.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://localhost:8080/api/library')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET("/authors")
  Future<List<Author>> getAuthors();

  @GET('/{currentUser}/books')
  Future<List<Book>> getBooks(@Path('currentUser') String currentUser);

  @GET('/{currentUser}/books/fav')
  Future<List<Book>> getFavBooks(@Path('currentUser') String currentUser);

  @POST("/{currentUser}/books")
  Future<Book> addBook(
    @Path("currentUser") String currentUser,
    @Body() Map<String, dynamic> body,
  );

  @DELETE("/{currentUser}/books/{bookId}")
  Future<void> deleteBook(
    @Path("currentUser") String currentUser,
    @Path("bookId") int bookId,
  );

  @PUT("/{currentUser}/books/{bookId}")
  Future<Book> toggleFavorite(
    @Path("currentUser") String currentUser,
    @Path("bookId") int bookId,
    @Query("favourite") bool favourite,
  );

  @GET("/{username}/books/search")
  Future<List<Book>> getBooksByAuthor(
    @Path("username") String username,
    @Query("authorName") String authorName,
  );
}
