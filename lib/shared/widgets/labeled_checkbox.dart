import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
    required this.activeColor,
    required this.checkColor,
    required this.style,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;
  final Color activeColor;
  final Color checkColor;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue);
              },
              activeColor: activeColor,
              checkColor: checkColor,
            ),
            Expanded(
                child: Text(
              label,
              style: style,
            )),
          ],
        ),
      ),
    );
  }
}
