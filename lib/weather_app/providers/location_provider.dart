import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hello_world/weather_app/helpers/weather_utils.dart';
import 'package:hello_world/weather_app/models/current_weather_models.dart';
import 'package:hello_world/weather_app/models/forecast_weather_model.dart';
import 'package:http/http.dart' as Http;
import 'package:http/http.dart';

class LocationProvider with ChangeNotifier {
  Position _position = Position(
    longitude: 0.0,
    latitude: 0.0,
    timestamp: DateTime.now(),
    accuracy: 0.0,
    altitude: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
  );

  Position get pos => _position;

  void setNewPosition(Position position) {
    _position = position;
    notifyListeners();
  }

  bool isLoading = false;

  void initializeUserPosition() {
    isLoading = true;
    getCurrentPosition().then((value) {
      _position = value;

      getCurrentWeather();
      print(_position.toJson());
      notifyListeners();
    }).onError((error, stackTrace) {
      isLoading = false;
      notifyListeners();
    });
  }

  CurrentWeatherModels currentWeatherModels = CurrentWeatherModels();

  getCurrentWeather() async {
    isLoading = true;
    currentWeatherModels = CurrentWeatherModels();
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${_position.latitude}&lon=${_position.longitude}&appid=7792f9be1763a0c406c45e4049b1ab58&units=metric';
    try {
      Response response = await Http.get(Uri.parse(url));
      currentWeatherModels = CurrentWeatherModels.fromJson(jsonDecode(response.body));
      getForecastWeather();
      print(response.body);
    } catch (e) {
      throw e;
    }
    isLoading = false;
    notifyListeners();
  }

  List<ForecastWeatherModel> forecastLists = [];
  List<ForecastWeatherModel> forecastListsTemp = [];

  getForecastWeather() async {
    isLoading = true;
    forecastLists.clear();
    forecastLists = [];
    forecastListsTemp.clear();
    forecastListsTemp = [];
    String url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=${_position.latitude}&lon=${_position.longitude}&appid=7792f9be1763a0c406c45e4049b1ab58&units=metric';
    try {
      Response response = await Http.get(Uri.parse(url));
      jsonDecode(response.body)['list'].forEach((element) {
        forecastLists.add(ForecastWeatherModel.fromJson(element));
      });

      forecastListsTemp.addAll(forecastLists);

      print(response.body);
    } catch (e) {
      throw e;
    }
    isLoading = false;
    notifyListeners();
  }

  void searchQuery(String value) {
    forecastLists.clear();
    forecastLists = [];
    // print(value);
    if (value.isEmpty) {
      forecastLists.addAll(forecastListsTemp);
      notifyListeners();
    } else {
      for (var element in forecastListsTemp) {
        print('khan  $value ${element.main!.humidity}  ${element.main!.humidity as int <= int.parse(value)}');
        if (int.parse(value) > 0 && element.main!.humidity as int <= int.parse(value)) {

          print('shuvo $element');

          forecastLists.add(element);
        }
      }
      notifyListeners();
    }
  }
}

// ctrl + alt + L    Rearrange
