import 'package:app/components/button.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatefulWidget {
  final VoidCallback onContinue;
  final bool stageOneCompleted;

  const ButtonRow({
    @required this.onContinue,
    @required this.stageOneCompleted,
  });

  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> _buttonProgress;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _buttonProgress = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onContinue();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 32) / 2;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        if (widget.stageOneCompleted)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AnimatedBuilder(
              animation: _buttonProgress,
              builder: (_, __) => LinearProgressIndicator(
                value: _buttonProgress.value,
              ),
            ),
          ),
        Padding(
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
                  widget.stageOneCompleted ? 'Nein danke' : 'Geht nicht',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Button(
                color: Theme.of(context).primaryColor,
                onTapDown: (_) {
                  if (widget.stageOneCompleted) {
                    controller.forward();
                  }
                },
                onPressed: () {
                  if (!widget.stageOneCompleted) {
                    widget.onContinue();
                  } else {
                    controller.stop();
                    controller.reverse();
                  }
                },
                child: Text(
                  widget.stageOneCompleted ? 'Mache ich' : 'Ich habe Interesse',
                  style: TextStyle(color: Colors.white),
                ),
                minWidth: width,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
