import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

final dio = Dio();

class AbsenService {
  var token =
      '649700dc70abb6824b2e87be060dd694001719a8598b06c19102b8ef07c8a5d4';

  // Future<AbsensiModels> postAbsensi(UserData data) async {
  //   try {
  //     var body = {"nis", data.nis, "name", data.name, "image", data.image};

  //     final response = await dio.post("http://localhost:8080/attendance",
  //         options: Options(headers: {
  //           "Content-Type": "application/json",
  //           "Authorization": "Bearer $token"
  //         }),
  //         data: body);
  //     var user = AbsensiModels.fromJson(response.data);
  //     return user;
  //   } catch (e) {
  //     print(e.toString());
  //     rethrow;
  //   }
  // }

  Future<http.Response> absen({
    required String nis,
    required String name,
    required File imageFile,
    required String latitude,
    required String longitude,
  }) async {
    final url =
        Uri.parse('https://rjbv4f3d-8080.asse.devtunnels.ms/attendance');

    final headers = {
      "Content-Type": "application/json",
      // Add any other headers if needed
    };

    final bytes = await imageFile.readAsBytes();
    final base64Image = base64Encode(bytes);

    final body = jsonEncode({
      "nis": nis,
      "name": name,
      "image": base64Image,
      "lat": latitude,
      "lon": longitude,
    });

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      print('nis $nis');
      print('name $name');
      print('latitude $latitude');
      print('longitude $longitude');
      print('response $response');

      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}

class UserData {
  final String nis;
  final String name;
  final String image;

  UserData({required this.nis, required this.name, required this.image});
}
