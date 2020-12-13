// Home Screen View #1: Big top banner, list of products
// Author: Appproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes.dart';
import '../../../../config/theme.dart';
import '../../../../presentation/features/home/home_bloc.dart';
import '../../../../presentation/features/home/home_event.dart';
import '../../../../presentation/features/home/home_state.dart';
import '../../../../presentation/features/wrapper.dart';
import '../../../../presentation/widgets/widgets.dart';

class Main1View extends StatefulWidget {
  final Function changeView;

  const Main1View({Key key, this.changeView}) : super(key: key);

  @override
  _Main1ViewState createState() => _Main1ViewState();
}

class _Main1ViewState extends State<Main1View> {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    var widgetWidth = width - AppSizes.sidePadding * 2;
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: width * 1.43,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/splash/splash-home.png'),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: AppSizes.sidePadding,
                      ),
                      width: width / 2,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('fashionSale',
                            style: _theme.textTheme.headline5),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: AppSizes.sidePadding,
                          bottom: AppSizes.sidePadding,
                          top: AppSizes.sidePadding),
                      width: 160,
                      child: AppButton(
                        title: 'Check',
                        width: 160,
                        height: 48,
                        onPressed: (() => widget.changeView(
                            changeType: ViewChangeType.Forward)),
                      ),
                    )
                  ],
                )),
            AppBlockHeader(
              width: widgetWidth,
              title: 'New',
              linkText: 'View All',
              onLinkTap: () => {
                Navigator.of(context)
                    .pushNamed(AppRoutes.signin, arguments: null)
              },
              description: 'You’ve never seen it before!',
            )
          ],
        ),
      );
    });
  }
}
