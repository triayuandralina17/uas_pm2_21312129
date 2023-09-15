import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference mahasiswas = firestore.collection('mahasiswa_21312129');

    return mahasiswas.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference mahasiswas = firestore.collection('mahasiswa_21312129');
    return mahasiswas.snapshots();
  }

  void deletemahasiswa(String id) {
    DocumentReference docRef =
        firestore.collection("mahasiswa_21312129").doc(id);

    try {
      Get.defaultDialog(
        title: "info",
        middleText: "Apakah anda yakin ingin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }
}
