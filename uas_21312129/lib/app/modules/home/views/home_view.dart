import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uas_21312129/app/controllers/auth_controller.dart';
import 'package:uas_21312129/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();

  void showOption(id) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.toNamed(
                Routes.UPDATE_mahasiswa,
                arguments: id,
              );
            },
            title: Text('Update'),
          ),
          ListTile(
            onTap: () {
              Get.back();
              controller.deletemahasiswa(id);
            },
            title: Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => cAuth.logout(),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      //1. Menampilkan data tidak realtime
      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //   future: controller.GetData(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       //mengambil data
      //       var ListAllDocs = snapshot.data!.docs;
      //       return ListView.builder(
      //         itemCount: ListAllDocs.length,
      //         itemBuilder: (context, Index) => ListTile(
      //           title: Text(
      //             "${(ListAllDocs[Index].data() as Map<String, dynamic>)["nama"]}"),
      //           subtitle: Text(
      //             "${(ListAllDocs[Index].data() as Map<String, dynamic>)["npm"]}"),
      //           ),
      //         );
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
      //2. Menampilkan data secara realtime
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: FirebaseFirestore.instance
            .collection('mahasiswa_21312129')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            //mengambil data
            var ListAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: ListAllDocs.length,
              itemBuilder: (context, Index) => ListTile(
                leading: CircleAvatar(
                  child: Text('${Index + 1}'),
                  backgroundColor: Colors.white,
                ),
                title: Text(
                    "${(ListAllDocs[Index].data() as Map<String, dynamic>)["name"]}"),
                subtitle: Text(
                    "${(ListAllDocs[Index].data() as Map<String, dynamic>)["NPM"]}"),
                trailing: IconButton(
                  onPressed: () => showOption(ListAllDocs[Index].id),
                  icon: Icon(Icons.more_vert),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_mahasiswa),
        child: Icon(Icons.add),
      ),
    );
  }
}
