import 'package:flutter/material.dart';
import 'package:hello_world/weather_app/providers/location_provider.dart';
import 'package:hello_world/weather_app/utils/custome_style.dart';
import 'package:hello_world/weather_app/utils/date_converter.dart';
import 'package:hello_world/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class ForecastWeatherPage extends StatelessWidget {
  ForecastWeatherPage({Key? key}) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocationProvider>(
        builder: (context, locationProvider, child) => Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'search......',
              ),
              style: rajdhaniSemiBold600!.copyWith(color: Colors.white),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                locationProvider.searchQuery(value);
              },
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: CustomTextField(controller: textEditingController,
            //     hintText: 'Search Humidity...',
            //     inputType: TextInputType.number,
            //     onChanged: (value){
            //       print(value);
            //       locationProvider.searchQuery(value);
            //   },),
            // ),

            Expanded(
              child: ListView.builder(
                itemCount: locationProvider.forecastLists.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      locationProvider.updateUserInfo('Mehedi Hasan Shuvo', '1021212919');
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${getFormattedDate(locationProvider.forecastLists[index].dt as int, "EEEE, MMM d hh:mm a, ''yy")}',
                            style: rajdhaniRegular400!.copyWith(fontSize: 18),
                          ),
                          forcastRowWidget('Temp: ',
                              '${locationProvider.forecastLists[index].main!.temp} ${locationProvider.isOpenForCelsius ? "ºC" : "ºF"}'),
                          forcastRowWidget('Min Temp: ',
                              '${locationProvider.forecastLists[index].main!.tempMin} ${locationProvider.isOpenForCelsius ? "ºC" : "ºF"}'),
                          forcastRowWidget('Max Temp: ',
                              '${locationProvider.forecastLists[index].main!.tempMax} ${locationProvider.isOpenForCelsius ? "ºC" : "ºF"}'),
                          forcastRowWidget('Humidity: ', '${locationProvider.forecastLists[index].main!.humidity}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget forcastRowWidget(String title, String value) {
    return Row(
      children: [
        Expanded(
            child: Text(
          title,
          textAlign: TextAlign.right,
          style: rajdhaniSemiBold600!.copyWith(fontSize: 18),
        )),
        Expanded(flex: 2, child: Text('  ${value}', style: rajdhaniSemiBold600!.copyWith(fontSize: 18))),
      ],
    );
  }
}
