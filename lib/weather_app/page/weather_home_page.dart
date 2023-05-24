import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/weather_app/helpers/weather_utils.dart';
import 'package:hello_world/weather_app/page/current_weather_page.dart';
import 'package:hello_world/weather_app/page/forecast_weather_page.dart';
import 'package:hello_world/weather_app/providers/location_provider.dart';
import 'package:hello_world/weather_app/widgets/city_search_delegate.dart';
import 'package:provider/provider.dart';

class WeatherHomePage extends StatefulWidget {
  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).getTempValue();
    Provider.of<LocationProvider>(context, listen: false).initializeUserPosition();
  }

  String queryString = '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
          actions: [
            Consumer<LocationProvider>(builder: (context, locationProvider, child) {
              return Switch(
                  value: locationProvider.isOpenForCelsius,
                  onChanged: (value) {
                    locationProvider.changeTempValue(value);
                  });
            }),
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CitySearchDelegate()).then((value) {
                    setState(() {
                      queryString = value;
                      print(queryString);
                    });
                  });
                },
                icon: Icon(Icons.search)),
          ],
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
