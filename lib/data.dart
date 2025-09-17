import 'package:book_library_cubit/models/author.dart';
import 'package:book_library_cubit/models/book.dart';
import 'package:book_library_cubit/models/user.dart';

final List<User> _users = [
  User(
    name: "Akshada",
    books: [
      Book(
        id: 1,
        name: "The Last Mile",
        author: Author(id: 4, name: "David Baldacci", rating: 1),
        description:
            "An Amos Decker thriller about memory, murder, and justice.",
      ),
      Book(
        id: 2,
        name: "The Night Hawks",
        author: Author(id: 1, name: "Elly Griffiths", rating: 4),
        description:
            "A Ruth Galloway mystery involving an archaeological dig and a murder.",
      ),
      Book(
        id: 3,
        name: "Pretty Girls",
        author: Author(id: 10, name: "Karin Slaughter", rating: 3),
        description:
            "A psychological thriller that unravels dark family secrets.",
      ),
      Book(
        id: 4,
        name: "The Seven Sisters",
        author: Author(id: 8, name: "Lucinda Riley", rating: 2),
        description:
            "The first book in the epic Seven Sisters series about love and family.",
      ),
    ],
  ),
  User(
    name: "Patrick",
    books: [
      Book(
        id: 5,
        name: "Memory Man",
        author: Author(id: 4, name: "David Baldacci", rating: 1),
        description:
            "The first Amos Decker novel about a detective who never forgets.",
      ),
      Book(
        id: 6,
        name: "The Lantern Men",
        author: Author(id: 1, name: "Elly Griffiths", rating: 4),
        description:
            "A Ruth Galloway mystery tied to folklore and serial killings.",
      ),
      Book(
        id: 7,
        name: "The Good Daughter",
        author: Author(id: 10, name: "Karin Slaughter", rating: 3),
        description:
            "A powerful story of two sisters bound by a violent tragedy.",
      ),
      Book(
        id: 8,
        name: "The Shadow Sister",
        author: Author(id: 8, name: "Lucinda Riley", rating: 2),
        description:
            "The third book in the Seven Sisters series about family and secrets.",
      ),
    ],
  ),
];
List<User> getUsers() {
  return _users;
}
