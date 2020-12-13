import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widgets.dart';

import '../wrapper.dart';
import 'profile.dart';
import 'profile_bloc.dart';
import 'views/settings.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        title: 'My Profile',
        body: BlocProvider<ProfileBloc>(
            create: (context) {
              return ProfileBloc()..add(ProfileStartEvent());
            },
            child: ProfileWrapper()),
        bottomMenuIndex: 4,
      ),
    );
  }
}

class ProfileWrapper extends StatefulWidget {
  @override
  _ProfileWrapperState createState() => _ProfileWrapperState();
}

class _ProfileWrapperState extends AppWrapperState<ProfileWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        cubit: BlocProvider.of<ProfileBloc>(context),
        builder: (BuildContext context, ProfileState state) {
          return getPageView(<Widget>[
            ProfileView(changeView: changePage),
            SettingsView(changeView: changePage),
          ]);
        });
  }
}
