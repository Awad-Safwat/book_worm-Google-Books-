import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class DeleteFromMyBooksUseCase extends UseCase<void, String?> {
  @override
  Future<Either<ServerFalure, void>> call([String? bookId]) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
