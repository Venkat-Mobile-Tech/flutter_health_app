import 'package:equatable/equatable.dart';

class HomeScreenState extends Equatable {
  final int currentPage;

  const HomeScreenState({this.currentPage = 0});

  HomeScreenState copyWith({int? currentPage}) {
    return HomeScreenState(currentPage: currentPage ?? this.currentPage);
  }

  @override
  List<Object?> get props => [currentPage];
}
