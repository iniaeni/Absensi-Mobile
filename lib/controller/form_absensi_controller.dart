import 'dart:io';
import 'package:absensi_project/service/absen_service/absen_service.dart';
import 'package:d_info/d_info.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GetFormAbsensiController extends GetxController {
  final RxString _input_nis = ''.obs;
  final RxString _input_name = ''.obs;
  final RxString _input_image = ''.obs;
  final RxString _input_latitude = ''.obs;
  final RxString _input_longitude = ''.obs;
  String get inputNis => _input_nis.value;
  set inputNis(String n) => _input_nis.value = n;
  String get inputName => _input_name.value;
  set inputName(String n) => _input_name.value = n;
  String get inputImage => _input_image.value;
  set inputImage(String n) => _input_image.value = n;
  String get inputLatitude => _input_latitude.value;
  set inputLatitude(String n) => _input_latitude.value = n;
  String get inputLongitude => _input_longitude.value;
  set inputLongitude(String n) => _input_longitude.value = n;

  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    inputLatitude = position.latitude.toString();
    inputLongitude = position.longitude.toString();
    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  }

  doAbsen() async {
    print('inputNis $inputNis');
    print('inputName $inputName');
    print('inputImage $inputImage');
    print('inputLatitude $inputLatitude');
    print('inputLongitude $inputLongitude');

    try {
      getLocation();
      if (inputLatitude == '' || inputLongitude == '') {
        DInfo.toastError('Lokasi Tidak Ditemukan');
        return;
      }

      final image = File(inputImage);
      final res = await AbsenService().absen(
        nis: inputNis,
        name: inputName,
        imageFile: image,
        latitude: inputLatitude,
        longitude: inputLongitude,
      );

      print('res ${res.statusCode}');

      if (res.statusCode == 200) {
        // Handle the success case
        DInfo.toastSuccess('Selamat Anda Telah Melakukan Absen');
      } else {
        // Handle other status codes or error responses
        print('Response data: ${res.body}');
        DInfo.toastError('Error: ${res.reasonPhrase}');
      }
    } catch (e) {
      // Handle other exceptions
      print('Error: $e');
      DInfo.toastError('An error occurred');
    }
  }
}
