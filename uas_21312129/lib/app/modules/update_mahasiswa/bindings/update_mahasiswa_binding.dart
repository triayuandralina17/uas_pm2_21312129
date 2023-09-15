import 'package:get/get.dart';

import '../controllers/update_mahasiswa_controller.dart';

class UpdatemahasiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatemahasiswaController>(
      () => UpdatemahasiswaController(),
    );
  }
}
