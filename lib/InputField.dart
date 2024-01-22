import 'package:absensi_project/controller/form_absensi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef OnChange = void Function(String? value);

class InputField extends StatelessWidget {
  InputField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  /// get realtime value from input
  final OnChange? onChanged;

  final inputForm = Get.put(GetFormAbsensiController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(),
            ),
            labelText: 'Nis *',
          ),
          controller: TextEditingController(),
          onChanged: (value) {
            inputForm.inputNis = value;
          },
        ),
        const SizedBox(height: 15),
        TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(),
            ),
            labelText: 'Nama *',
          ),
          controller: TextEditingController(),
          onChanged: (value) {
            inputForm.inputName = value;
          },
        ),
        Obx(() => Column(
              children: [
                Text(
                  inputForm.inputNis,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                Text(
                  inputForm.inputName,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ))
      ],
    );
  }
}
