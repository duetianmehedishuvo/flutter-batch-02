import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hello_world/weather_app/helpers/weather_utils.dart';
import 'package:hello_world/weather_app/models/current_weather_models.dart';
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
      isLoading = false;
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
    currentWeatherModels = CurrentWeatherModels();
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${_position.latitude}&lon=${_position.longitude}&appid=7792f9be1763a0c406c45e4049b1ab58&units=metric';
    try {
      Response response = await Http.get(Uri.parse(url));
      currentWeatherModels=CurrentWeatherModels.fromJson(jsonDecode(response.body));
      notifyListeners();
      print(response.body);
    } catch (e) {
      throw e;
    }
  }
}

// ctrl + alt + L    Rearrange
