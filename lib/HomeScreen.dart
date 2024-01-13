import 'package:flutter/material.dart';

import 'Header.dart';
import 'InputAbsensi.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.orange,
            Colors.orange,
            Colors.orange
          ]),
        ),

        child: Column(

          children: <Widget>[
            SizedBox(height: 50),
            Header(),

            // Gunakan Expanded untuk child yang membutuhkannya
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),

                child: InputAbsensi(),
              ),
              )


          ],
        ),
    )

    );
  }
}
