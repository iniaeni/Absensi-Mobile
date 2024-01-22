import 'dart:io';

import 'package:absensi_project/controller/form_absensi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'Button.dart';
import 'InputField.dart';

class InputAbsensi extends StatefulWidget {
  const InputAbsensi({super.key});

  @override
  _InputAbsensiState createState() => _InputAbsensiState();
}

class _InputAbsensiState extends State<InputAbsensi> {
  File? image;
  final inputForm = Get.put(GetFormAbsensiController());

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    // Capture a photo.
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.camera);
    setState(() {
      image = File(imagePicked!.path);
      inputForm.inputImage = image!.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('inputForm.inputImage: ${inputForm.inputImage}');
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.orange[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.orange, width: 2),
              ),
              child: SizedBox(
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Agar teks berada di sebelah kiri
                    children: [
                      const Text(
                        "SENIN",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "23 Oktober 2023",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                              ),
                              const Text(
                                "Saat Ini",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                "06:20",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                              ),
                              const Text(
                                "Keterlambatan",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                "07:30",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold),
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
            const SizedBox(height: 10),
            const Text(
              "FORM SISWA HADIR",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InputField(),
            ),
            const SizedBox(height: 15),
            image != null
                ? SizedBox(
                    width: 250,
                    height: 250,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: kIsWeb
                          ? Image.network(
                              Uri.parse(image!.path).toString(),
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              image!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  )
                : Container(),
            const SizedBox(height: 15),
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
                  const SizedBox(height: 5),
                  const Text(
                    'Bukti Hadir',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Button(
                onPressed: () {
                  inputForm.doAbsen();
                },
                title: "Hadir"),
          ],
        ),
      ),
    );
  }
}
