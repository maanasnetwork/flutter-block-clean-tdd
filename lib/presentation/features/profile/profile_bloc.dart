import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  @override
  ProfileBloc() : super(ProfileInitialState());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {}
}
