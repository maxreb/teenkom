import 'package:flutter/material.dart';

class JobListItem extends StatelessWidget {
  final int index;
  final VoidCallback onTap;

  const JobListItem({Key key, @required this.index, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$index'),
      onTap: onTap,
    );
  }
}
