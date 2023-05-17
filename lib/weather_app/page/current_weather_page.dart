import 'package:flutter/material.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Current',style: TextStyle(color: Colors.white))),
    );
  }
}
