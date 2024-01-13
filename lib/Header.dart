import 'package:flutter/material.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Positioned(
            top: 0,
            left: 0,
            child: Text("Selamat Datang!", style: TextStyle(color: Colors.yellow, fontSize: 24, fontWeight: FontWeight.bold,),),),

        ),
        SizedBox( ),
        Center(
          child: Stack(
          children: [
          Image.asset(
          'assets/images/dash.png',
          width: 300,
          height: 150,
          ),
          ],
          )
        )
      ],
    ),);
  }
}