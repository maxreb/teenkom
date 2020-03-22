import 'package:app/components/button.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final VoidCallback onContinue;
  final bool stageOneCompleted;

  const ButtonRow({
    @required this.onContinue,
    @required this.stageOneCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 32) / 2;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Button(
            minWidth: width,
            color: Theme.of(context).accentColor, //Colors.lightBlueAccent,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              stageOneCompleted ? 'Nein danke' : 'Geht nicht',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Button(
            color: Theme.of(context).primaryColor, //Color(0xFF77dd77),
            onPressed: onContinue,
            child: Text(
              stageOneCompleted ? 'Mache ich' : 'Ich habe Interesse',
              style: TextStyle(color: Colors.white),
            ),
            minWidth: width,
          ),
        ],
      ),
    );
  }
}
