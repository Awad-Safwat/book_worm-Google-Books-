import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:book_worm/features/my_books/data/repos_imple/my_books_repos_imple.dart';
import 'package:dartz/dartz.dart';

class AddToMyBooksUseCase extends UseCase<void, String?> {
  final MyBooksReposImple myBooksReposImple;

  AddToMyBooksUseCase({required this.myBooksReposImple});

  @override
  Future<Either<ServerFalure, void>> call([String? bookId]) async {
    return await myBooksReposImple.addToMyBooks(bookId: bookId!);
  }
}
