import 'package:flutter/material.dart';
import 'package:hello_world/weather_app/providers/location_provider.dart';
import 'package:hello_world/weather_app/utils/city_utils.dart';
import 'package:provider/provider.dart';

class CitySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.cancel))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestions = query.isEmpty ? cityLists : cityLists.where((city) => city.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Provider.of<LocationProvider>(context,listen: false).searchCityPosition();
            },
            child: Card(
              child: ListTile(
                title: Text(suggestions[index]),
              ),
            ),
          );
        });
  }
}
