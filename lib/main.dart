import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading Placeholder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                child: LoadingAlert(
                  placeHolderWidget: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey,),
                  color: Colors.grey[200],
                ),
                child: LoadingAlert(
                  placeHolderWidget: Icon(
                    Icons.image,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingAlert extends StatefulWidget {
  final Widget placeHolderWidget;
  LoadingAlert({@required this.placeHolderWidget});
  @override
  _LoadingAlertState createState() => _LoadingAlertState();
}

class _LoadingAlertState extends State<LoadingAlert> {
  bool _visible = false;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 500), (Timer t) {
      _callSetState();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _callSetState() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.1,
      duration: Duration(milliseconds: 500),
      child: widget.placeHolderWidget,
    );
  }
}
