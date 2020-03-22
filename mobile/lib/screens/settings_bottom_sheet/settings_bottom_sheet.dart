import 'package:flutter/material.dart';

class SettingsBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 16),
        Image.asset(
          'images/blitzjobber.png',
          width: 60,
          height: 60,
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Erika Musterfrau',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        SizedBox(height: 8),
        const Divider(height: 4),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Einen Coach kontaktieren'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Ausloggen'),
          onTap: () {},
        ),
      ],
    );
  }
}
