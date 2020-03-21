import 'package:flutter/material.dart';

class JobData extends StatefulWidget {
  final bool showDetails;

  const JobData({Key key, this.showDetails = true}) : super(key: key);

  @override
  _JobDataState createState() => _JobDataState();
}

class _JobDataState extends State<JobData>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> _fadeInAnimation;

  @override
  void didUpdateWidget(JobData oldWidget) {
    if (oldWidget.showDetails != widget.showDetails) controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );
    if (widget.showDetails) controller.value = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Text(
            'Gartenarbeit',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        ListTile(
          title: Text('Samstag 28. März. 10 - 13 Uhr'),
        ),
        SizedBox(height: 16),
        if (widget.showDetails) ...[
          FadeTransition(
            opacity: _fadeInAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Details', style: Theme.of(context).textTheme.button,),
            ),
          ),
          FadeTransition(
            opacity: _fadeInAnimation,
            child: ListTile(
              leading: Icon(Icons.terrain),
              title: Text('Tätigkeiten:  Rasen mähen, Laub harken'),
            ),
          ),
          FadeTransition(
            opacity: _fadeInAnimation,
            child: ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Karow Pankow, 45 Min. Fahrweg von zuhause'),
            ),
          ),
          FadeTransition(
            opacity: _fadeInAnimation,
            child: ListTile(
              leading: Icon(Icons.euro_symbol),
              title: Text('6 €/Std. + 3 € Anfahrt'),
            ),
          ),
          FadeTransition(
            opacity: _fadeInAnimation,
            child: ListTile(
              leading: Icon(Icons.event_note),
              title: Text(
                'CORONA: eigene Handschuhe mitbringen, min. 2 Meter Abstand zu Leute, nicht im Haus von Kunde reingehen, Gespräche',
              ),
            ),
          )
        ],
      ],
    );
  }
}
