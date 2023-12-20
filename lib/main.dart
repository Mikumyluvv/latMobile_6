import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_modul_6/app/modules/home/bindings/home_binding.dart';
import 'package:latihan_modul_6/app/modules/home/bindings/latihan1_binding.dart';
import 'package:latihan_modul_6/app/modules/home/bindings/latihan2_binding.dart';
import 'package:latihan_modul_6/app/modules/home/views/home_view.dart';
import 'package:latihan_modul_6/app/modules/home/views/latihan1_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "FLutter Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
            name: '/lat1',
            page: () => const Latihan1_View(),
            binding: Latihan1_Binding()),
        GetPage(
            name: '/lat2',
            page: () => const Latihan1_View(),
            binding: Latihan2_Binding()),
      ],
    );
  }
}
