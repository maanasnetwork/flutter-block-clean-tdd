import 'package:bloc/bloc.dart';
import '../../../locator.dart';

import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadEvent) {
      if (state is HomeInitialState) {
        yield state;
      } else if (state is HomeLoadedState) {
        yield state;
      }
    }
  }
}
