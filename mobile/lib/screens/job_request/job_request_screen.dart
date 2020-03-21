import 'package:app/components/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobRequestScreen extends StatefulWidget {
  final String id;

  const JobRequestScreen({Key key, this.id}) : super(key: key);

  @override
  _JobRequestScreenState createState() => _JobRequestScreenState();
}

class _JobRequestScreenState extends State<JobRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anfrage'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.id),
          Text('test2'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Button(
                    minWidth: (MediaQuery.of(context).size.width - 32) / 2,
                    color: Colors.lightBlueAccent,
                    onPressed: () {},
                    child: Text(
                      'Nein danke',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Button(
                    color: Color(0xFF77dd77),
                    onPressed: () {},
                    child: Text(
                      'Ich habe Interesse',
                      style: TextStyle(color: Colors.white),
                    ),
                    minWidth: (MediaQuery.of(context).size.width - 32) / 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
