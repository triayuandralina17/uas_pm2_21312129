import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddmahasiswaController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNPM;
  late TextEditingController cAlamat;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addmahasiswa(String nama, String NPM, String alamat) async {
    CollectionReference mahasiswa = firestore.collection("mahasiswa_21312129");
    try {
      await mahasiswa.add({
        "name": nama,
        "NPM": NPM,
        "address": alamat,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data mahasiswa",
          onConfirm: () {
            cNama.clear();
            cNPM.clear();
            cAlamat.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cNPM = TextEditingController();
    cAlamat = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNama.dispose();
    cNPM.dispose();
    cAlamat.dispose();
    super.onClose();
  }
}
