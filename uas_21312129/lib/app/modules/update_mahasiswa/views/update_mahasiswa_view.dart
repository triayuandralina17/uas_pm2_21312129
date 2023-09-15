import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_mahasiswa_controller.dart';

class UpdatemahasiswaView extends GetView<UpdatemahasiswaController> {
  const UpdatemahasiswaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update Mahasiswa'),
          centerTitle: true,
        ),
        body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
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
                      autocorrect: false,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "NPM Mahasiswa"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () => controller.updatemahasiswa(
                            controller.cNama.text,
                            controller.cNPM.text,
                            Get.arguments),
                        child: Text("Ubah")),
                  ],
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
