// Home Screen View #2: small top banner, list of products sale and new
// Author: Appproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes.dart';
import '../../../../config/theme.dart';
import '../../../../presentation/features/home/home_bloc.dart';
import '../../../../presentation/features/home/home_event.dart';
import '../../../../presentation/features/wrapper.dart';
import '../../../../presentation/widgets/widgets.dart';

class Main2View extends StatefulWidget {
  final Function changeView;

  const Main2View({Key key, this.changeView}) : super(key: key);

  @override
  _Main2ViewState createState() => _Main2ViewState();
}

class _Main2ViewState extends State<Main2View> {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    var widgetWidth = width - AppSizes.sidePadding * 2;
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
          height: width * 0.52,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/splash/topbanner.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: AppSizes.sidePadding),
                  width: width,
                  child: Text('Street clothes',
                      style: _theme.textTheme.headline5.copyWith(fontSize: 34)))
            ],
          )),
      AppBlockHeader(
        width: widgetWidth,
        title: 'Sale',
        linkText: 'View All',
        onLinkTap: () => {
          Navigator.of(context).pushNamed(AppRoutes.signin, arguments: null)
        },
        description: 'Super summer sale',
      ),
      AppButton(
        title: 'Next Home Page',
        width: 160,
        height: 48,
        onPressed: (() =>
            widget.changeView(changeType: ViewChangeType.Forward)),
      )
    ]));
  }
}
