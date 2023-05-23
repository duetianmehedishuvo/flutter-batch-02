import 'package:flutter/material.dart';
import 'package:hello_world/weather_app/providers/location_provider.dart';
import 'package:hello_world/weather_app/utils/date_converter.dart';
import 'package:provider/provider.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocationProvider>(
        builder: (context,locationProvider,child)=>ListView(
          children: [
            Text('${locationProvider.currentWeatherModels.main!.temp} ºC'),
            Text('${getFormattedDate(locationProvider.currentWeatherModels.dt as int, "EEEE, MMM d hh:mm a, ''yy")}',style: TextStyle(fontSize: 30),),
          ],
        ),
      ),
    );
  }
}
