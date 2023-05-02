import 'package:flutter/material.dart';

class CustomLudoKingWidget extends StatelessWidget {
   const CustomLudoKingWidget(this.value,{Key? key}) : super(key: key);

  final int value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.fromLTRB(10, 0, 5, 3),
      decoration: BoxDecoration(
          color: const Color(0xff000000),
          shape: BoxShape.rectangle,

          // network image
          // Assets Image
          // File Image / Raw Image

          image: DecorationImage(image: AssetImage('assets/images/dice_$value.png')),
          gradient: const LinearGradient(
              colors: [Colors.brown, Colors.deepOrange, Colors.lightGreen], begin: Alignment.topCenter, end: Alignment.bottomCenter),

          // boxShadow: [
          //   BoxShadow(color: Colors.green.withOpacity(0.433),spreadRadius: 10,blurRadius: 10,offset: Offset(5,5))
          // ],
          borderRadius: const BorderRadius.horizontal(left: Radius.circular(30)),
          border: Border.all(color: Colors.red)),
    );
  }
}
