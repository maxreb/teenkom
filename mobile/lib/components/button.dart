import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final GestureTapDownCallback onTapDown;
  final GestureTapCancelCallback onTapCancel;
  final Widget child;
  final double minWidth;

  const Button({
    Key key,
    this.color,
    @required this.onPressed,
    @required this.child,
    this.minWidth,
    this.onTapDown,
    this.onTapCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: minWidth, minHeight: 50),
      child: Material(
        textStyle: Theme.of(context).textTheme.button,
        color: color,
        elevation: 4,
        child: InkWell(
          onTap: onPressed,
          onTapDown: onTapDown,
          onTapCancel: onTapCancel,
          child: Center(child: child),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
