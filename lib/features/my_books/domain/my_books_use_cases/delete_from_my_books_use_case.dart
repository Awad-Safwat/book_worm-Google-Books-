import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:book_worm/features/my_books/data/repos_imple/my_books_repos_imple.dart';
import 'package:dartz/dartz.dart';

class DeleteFromMyBooksUseCase extends UseCase<void, String?> {
  final MyBooksReposImple myBooksReposImple;

  DeleteFromMyBooksUseCase({required this.myBooksReposImple});
  @override
  Future<Either<ServerFalure, void>> call([String? bookId]) async {
    return await myBooksReposImple.deleteFromMyBooks(bookId: bookId!);
  }
}
