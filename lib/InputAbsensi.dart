import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Button.dart';
import 'InputField.dart';

class InputAbsensi extends StatefulWidget {
  @override
  _InputAbsensiState createState() => _InputAbsensiState();
}

class _InputAbsensiState extends State<InputAbsensi> {
  File? image;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    // Capture a photo.
    final XFile? imagePicked =
    await picker.pickImage(source: ImageSource.camera);
    setState(() {
      image = File(imagePicked!.path);
    });
  }

    @override
   
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Card(
              color: Colors.orange[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.orange, width: 2),
              ),
              child: Container(
                width: 400,
                height: 150,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Agar teks berada di sebelah kiri
                    children: [
                      Text(
                        "SENIN",
                        style: TextStyle(fontSize: 18, color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "23 Oktober 2023",
                        style: TextStyle(fontSize: 14, color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),

                              ),
                              Text(
                                "Saat Ini",
                                style: TextStyle(fontSize: 14, color: Colors.orange, fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "06:20",
                                style: TextStyle(fontSize: 25, color: Colors.orange, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),

                              ),
                              Text(
                                "Keterlambatan",
                                style: TextStyle(fontSize: 14, color: Colors.orange, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "07:30",
                                style: TextStyle(fontSize: 25, color: Colors.orange, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),


            SizedBox(height: 10),
            Text(
              "FORM SISWA HADIR",
              style: TextStyle(color: Colors.black, fontSize: 20,),
            ),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InputField(),
            ),
            SizedBox(height: 15),
            image != null
                ? Container(
                height: 100,
                width:MediaQuery.of(context).size.width,
                child: Image.file(
                  image!,
                  fit: BoxFit.cover,))
                : Container(),
            SizedBox(height: 15),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () async {
                await getImage();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/cam.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Bukti Hadir',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),


            SizedBox(height: 40),
            Button()
          ],
        ),
      ),
    );
  }
}


