import 'package:flutter/material.dart';

class JobTitle extends StatelessWidget {
  final bool showName;

  const JobTitle({this.showName = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Text(
            'Gartenarbeit${showName ? ' bei Frau Maier' : ''}',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        ListTile(
          title: Text('Samstag 28. März. 10 - 13 Uhr'),
        ),
      ],
    );
  }
}
