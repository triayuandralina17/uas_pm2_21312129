import 'package:get/get.dart';

import '../controllers/add_mahasiswa_controller.dart';

class AddmahasiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddmahasiswaController>(
      () => AddmahasiswaController(),
    );
  }
}
