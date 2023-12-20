import 'package:get/get.dart';
import 'package:latihan_modul_6/app/modules/home/controllers/latihan1_controller.dart';

class Latihan1_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Latihan1_Controller>(
      () => Latihan1_Controller(),
    );
  }
}
