import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_mahasiswa_controller.dart';

class AddmahasiswaView extends GetView<AddmahasiswaController> {
  const AddmahasiswaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Mahasiswa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNama,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Nama Mahasiswa"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNPM,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "NPM"),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller.cAlamat,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Alamat"),
            ),
            ElevatedButton(
              onPressed: () => controller.addmahasiswa(
                  controller.cNama.text,
                  controller.cNPM.text,
                  controller.cAlamat.text,
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
