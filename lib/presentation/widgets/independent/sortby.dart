import 'package:flutter/material.dart';
import '../../../config/theme.dart';
import '../../../data/model/sort_rules.dart';

import '../widgets.dart';

class AppSortBy extends StatelessWidget {
  final Function(SortRules) onSelect;
  final SortRules currentSortBy;

  const AppSortBy({Key key, this.onSelect, this.currentSortBy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var fullWidth = MediaQuery.of(context).size.width;
    return AppBottomPopup(
        title: 'Sort By',
        child: Container(
            padding: EdgeInsets.only(top: AppSizes.sidePadding),
            child: Column(children: buildSortBy(fullWidth, _theme))));
  }

  List<Widget> buildSortBy(double width, ThemeData _theme) {
    return SortRules.options
        .map((rule) => AppClickableLine(
              height: 58,
              width: width,
              title: rule.getSortTitle(),
              sortRules: rule,
              backgroundColor:
                  rule == currentSortBy ? _theme.accentColor : null,
              textColor: rule == currentSortBy ? AppColors.white : null,
              onTap: ((rule) => {onSelect(rule)}),
            ))
        .toList(growable: false);
  }
}
