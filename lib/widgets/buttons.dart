// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final IconData iconName;
  final Function onPress;
  const Buttons({
    Key? key,
    required this.iconName,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 9,
      borderRadius: BorderRadius.circular(30),
      shadowColor: Colors.black,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => onPress(),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color:Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
              child: Icon(
            iconName,
            color: Theme.of(context).iconTheme.color,
          )),
        ),
      ),
    );
  }
}
