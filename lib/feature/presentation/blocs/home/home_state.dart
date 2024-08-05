import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

final class CountHomeState extends HomeState {
  final int count;

  const CountHomeState(this.count);

  @override
  List<Object?> get props => [count];
}
