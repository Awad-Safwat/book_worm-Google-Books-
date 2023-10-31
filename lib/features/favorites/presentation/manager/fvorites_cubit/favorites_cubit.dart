import 'package:bloc/bloc.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubitCubit extends Cubit<FavoritesCubitState> {
  FavoritesCubitCubit() : super(FavoritesCubitInitial());
}
