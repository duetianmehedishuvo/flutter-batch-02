import 'package:flutter/material.dart';
import 'package:hello_world/weather_app/page/current_weather_page.dart';
import 'package:hello_world/weather_app/page/forecast_weather_page.dart';

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
          bottom: TabBar(
            tabs: [
              Tab(
                  child: Text(
                'Current',
                style: TextStyle(fontFamily: 'rajdhani', fontWeight: FontWeight.w600),
              )),
              Tab(child: Text('Forecast')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CurrentWeatherPage(),
            ForecastWeatherPage(),
          ],
        ),
      ),
    );
  }
}
