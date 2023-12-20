import 'package:get/get.dart';
import 'package:latihan_modul_6/app/modules/home/controllers/Latihan2_Controller.dart';
import 'package:latihan_modul_6/app/modules/home/controllers/latihan1_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<Latihan1_Controller>(
      () => Latihan1_Controller(),
    );
    Get.lazyPut<Latihan2_Controller>(
      () => Latihan2_Controller(),
    );
  }
}
