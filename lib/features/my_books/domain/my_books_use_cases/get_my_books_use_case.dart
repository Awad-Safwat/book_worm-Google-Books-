import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/my_books/data/repos_imple/my_books_repos_imple.dart';
import 'package:dartz/dartz.dart';

class GetMyBooksUseCase extends UseCase<List<BookEntity>, int> {
  final MyBooksReposImple myBooksReposImple;

  GetMyBooksUseCase({required this.myBooksReposImple});
  @override
  Future<Either<ServerFalure, List<BookEntity>>> call([int? pageNumber]) async {
    return await myBooksReposImple.getMyBooks(pageNumber: pageNumber ?? 0);
  }
}
