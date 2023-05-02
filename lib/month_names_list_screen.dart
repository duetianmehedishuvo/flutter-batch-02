import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hello_world/helper.dart';
import 'package:hello_world/movie_database.dart';
import 'package:hello_world/second_screen.dart';

// List view
// Grid View
// Singled Child Scrollview
// sliver list view

class MonthNamesListScreen extends StatelessWidget {
  MonthNamesListScreen({Key? key}) : super(key: key);

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'july',
    'august',
    'september',
    'october',
    'november',
    'december'
  ];

  MovieDatabase movieDatabase = MovieDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Months'),
      ),
      body: GridView.builder(
        itemCount: movieDatabase.movies.length,
        itemBuilder: (context, index) {
          return Hero(
            tag: 'shuvo $index',
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => SecondScreen(movieDatabase.movies[index])));
                },
                child: Container(
                  width: getScreenWidth(context),
                  // height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 4))]),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                          child: Image.network(
                            'https://www.queensjournal.ca/sites/default/files/img/story/2023/01/20/amna_avatar_movie_review_0.jpg',
                            height: 150,
                            fit: BoxFit.fitHeight,
                            width: 150,
                          )),
                      Text(movieDatabase.movies[index].name!)
                    ],
                  ),
                )),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          childAspectRatio: 0.8
        ),

      ),
    );
  }

  Widget buildCard(int index, BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print(movieDatabase.movies[index].name);

          Navigator.of(context).push(MaterialPageRoute(builder: (_) => SecondScreen(movieDatabase.movies[index])));
        },
        leading: CircleAvatar(
          child: Text(movieDatabase.movies[index].name!.substring(0, 1).toUpperCase()),
        ),
        title: Text(movieDatabase.movies[index].name!),
        subtitle: Text(movieDatabase.movies[index].category!),
        trailing: Icon(Icons.more_horiz),
      ),
    );
  }
}

//movieDatabase.movies[index]
