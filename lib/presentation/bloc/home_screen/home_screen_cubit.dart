import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(const HomeScreenState());

  void updatePage(int page) {
    emit(state.copyWith(currentPage: page));
  }
}
