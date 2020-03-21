import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final Widget child;
  final double minWidth;

  const Button({
    Key key,
    this.color,
    @required this.onPressed,
    @required this.child, this.minWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth,
      height: 50,
      onPressed: onPressed,
      color: color,
      elevation: 4,
      child: child,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
