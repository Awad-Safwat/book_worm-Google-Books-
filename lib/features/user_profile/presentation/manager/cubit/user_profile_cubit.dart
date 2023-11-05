import 'package:bloc/bloc.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:meta/meta.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());

  Future<UserEntity?>? getUserData() async {
    emit(UserProfileLoading());
    if (await isUserSignedIn()) {
      emit(UserProfileIsSigned());

      try {
        UserEntity user = getUserInfo();
        emit(UserProfileSuccess(user: user));

        return user;
      } catch (e) {
        emit(UserProfileIsNotAuthorized());
      }
    } else {
      emit(UserProfileIsNotSigned());
      return null;
    }
    return null;
  }

  void justEmitLoadingUser() {
    emit(UserProfileLoading());
  }
}
