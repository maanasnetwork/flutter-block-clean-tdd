import 'package:flutter/material.dart';
import '../../../config/theme.dart';

import 'block_subtitle.dart';

class AppColorSelect extends StatefulWidget {
  final List<Color> availableColors;
  final List<Color> selectedColors;
  final String label;
  final Function(List<Color>) onClick;

  const AppColorSelect(
      {Key key,
      @required this.availableColors,
      @required this.selectedColors,
      @required this.label,
      @required this.onClick})
      : super(key: key);

  @override
  _AppColorSelectState createState() => _AppColorSelectState();
}

class _AppColorSelectState extends State<AppColorSelect> {
  List<Color> selectedColors;

  @override
  void initState() {
    selectedColors = widget.selectedColors;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(children: <Widget>[
      AppBlockSubtitle(title: widget.label, width: width),
      Padding(
        padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
      ),
      Container(
        padding: EdgeInsets.symmetric(
            vertical: AppSizes.sidePadding,
            horizontal: AppSizes.sidePadding * 2),
        width: width,
        color: AppColors.white,
        child: Wrap(
          spacing: AppSizes.sidePadding,
          children: buildColors(context),
        ),
      )
    ]);
  }

  List<Widget> buildColors(BuildContext context) {
    var colorWidgets = <Widget>[];
    for (var i = 0; i < widget.availableColors.length; i++) {
      colorWidgets.add(
        InkWell(
          onTap: (() => {updateSelectedColors(widget.availableColors[i])}),
          child: buildColorWidget(widget.availableColors[i], context),
        ),
      );
    }
    return colorWidgets;
  }

  Container buildColorWidget(Color color, BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(22),
          ),
          border: widget.selectedColors.contains(color)
              ? Border.all(color: _theme.accentColor)
              : null,
        ),
        padding: EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              border: Border.all(color: _theme.primaryColorLight),
              color: color),
        ));
  }

  void updateSelectedColors(Color color) {
    if (selectedColors.contains(color)) {
      selectedColors.remove(color);
    } else {
      selectedColors.add(color);
    }
    setState(() {});
    widget.onClick(selectedColors);
  }
}
