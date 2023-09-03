import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  PageController controller = PageController();

  int currentPageIndex = 0;

  OnBoardingCubit() : super(OnBoardingInitial());

  void screenScrolling(int index) {
    if (index == 2) {
      emit(OnBoardingScrolled());
    } else {
      emit(OnBoardingInitial());
    }
  }

  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
