import 'package:flutter/material.dart';
import '../../../config/theme.dart';

class AppLabelRightCheckbox extends StatefulWidget {
  final bool checked;
  final String title;
  final Function(bool) onChanged;
  final double width;

  const AppLabelRightCheckbox(
      {Key key, this.checked, this.title, this.onChanged, this.width})
      : super(key: key);

  @override
  _AppLabelRightCheckboxState createState() => _AppLabelRightCheckboxState();
}

class _AppLabelRightCheckboxState extends State<AppLabelRightCheckbox> {
  bool _checked;

  @override
  void initState() {
    _checked = widget.checked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return InkWell(
        onTap: (() => {changeCheckboxValue(!_checked)}),
        child: Container(
            child: Row(
          children: <Widget>[
            Container(
                width: widget.width - 50,
                child: Text(widget.title,
                    style: _theme.textTheme.display1.copyWith(
                        color: _checked
                            ? _theme.accentColor
                            : _theme.primaryColor))),
            Container(
              child: Checkbox(
                activeColor: _theme.accentColor,
                checkColor: AppColors.white,
                value: _checked,
                onChanged: (bool value) {
                  changeCheckboxValue(value);
                },
              ),
            )
          ],
        )));
  }

  void changeCheckboxValue(bool newValue) {
    widget.onChanged(newValue);
    setState(() {
      _checked = newValue;
    });
  }
}
