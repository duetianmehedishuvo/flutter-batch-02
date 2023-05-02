import 'package:flutter/material.dart';
import 'package:hello_world/movie_model.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen(this.movieModel, {Key? key}) : super(key: key);
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
      ),
      body: Column(
        children: [
          customRowWidget('ID:', movieModel.id.toString()),
          customRowWidget('NAME:', movieModel.name.toString()),
          customRowWidget('Category:', movieModel.category.toString()),
          customRowWidget('Year:', movieModel.releaseYear.toString()),
        ],
      ),
    );
  }

  Widget customRowWidget(String title1, String title2) {
    return Row(
      children: [
        Expanded(child: Text(title1)),
        Expanded(flex: 2, child: Text(title2)),
      ],
    );
  }
}
