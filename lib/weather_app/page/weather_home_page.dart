import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/weather_app/helpers/weather_utils.dart';
import 'package:hello_world/weather_app/page/current_weather_page.dart';
import 'package:hello_world/weather_app/page/forecast_weather_page.dart';
import 'package:hello_world/weather_app/providers/location_provider.dart';
import 'package:provider/provider.dart';

class WeatherHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<LocationProvider>(context, listen: false).initializeUserPosition();

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
        body: Consumer<LocationProvider>(
          builder: (context, locationProvider, child) => TabBarView(
            children: [
              locationProvider.isLoading == true ? Center(child: CupertinoActivityIndicator(radius: 30)) : CurrentWeatherPage(),
              locationProvider.isLoading == true ? CircularProgressIndicator() : ForecastWeatherPage(),
            ],
          ),
        ),
      ),
    );
  }
}
