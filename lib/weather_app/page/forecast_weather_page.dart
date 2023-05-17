import 'package:flutter/material.dart';

class ForecastWeatherPage extends StatelessWidget {
  const ForecastWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Forecast',style: TextStyle(color: Colors.white))),
    );
  }
}
