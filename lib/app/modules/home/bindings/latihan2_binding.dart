import 'package:get/get.dart';
import 'package:latihan_modul_6/app/modules/home/controllers/Latihan2_Controller.dart';

class Latihan2_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Latihan2_Controller>(
      () => Latihan2_Controller(),
    );
  }
}
