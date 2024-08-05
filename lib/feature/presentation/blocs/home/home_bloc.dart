import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitial()) {
    listenEvent();
  }

  int count = 0;

  void listenEvent(){
    on<InitHomeEvent>((event, emit) {
      count = 0;
    });

    on<CountHomeEvent>((event, emit) {
      count++;
      emit.call(CountHomeState(count));
    });
  }
}
