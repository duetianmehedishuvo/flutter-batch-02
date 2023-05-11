import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/Provider/cart_provider.dart';
import 'package:hello_world/Provider/home_screen.dart';
import 'package:hello_world/Provider/increment_screen.dart';
import 'package:hello_world/Provider/product_provider.dart';
import 'package:hello_world/contact_list_screen.dart';
import 'package:hello_world/custom_ludo_king_widget.dart';
import 'package:hello_world/database/pages/add_employee_screens.dart';
import 'package:hello_world/database/pages/employee_list_screen.dart';
import 'package:hello_world/helper.dart';
import 'package:hello_world/month_names_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductProvider()),
      ChangeNotifierProvider(create: (context) => CartProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  @override
  void initState() {
    setState(() {
      index = Random.secure().nextInt(6) + 1;
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.home, size: 40, color: Colors.white),
        elevation: 0,
        centerTitle: true,
        title: const Text("Home Screen", style: TextStyle(color: Colors.white)),
        actions: const [
          Icon(Icons.add_alert_rounded),
          Icon(Icons.add),
        ],
      ),
      // expanded
      body: Container(
        width: getScreenWidth(context),
        height: getScreenHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // width,height,margin,padding,color,shape
            // CTRL+ALT+M

            CustomLudoKingWidget(index),

            MaterialButton(
                onPressed: () {
                  setState(() {
                    index = Random.secure().nextInt(6) + 1;
                  });
                },
                child: Text('Press Here'))
          ],
        ),
      ),
    );
  }
}
