import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_modul_6/app/modules/home/controllers/latihan1_controller.dart';

class Latihan1_View extends GetView<Latihan1_Controller> {
  const Latihan1_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan 1'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.posts.value.userId != 0) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('User ID: ${controller.posts.value.userId}'),
                Text('ID: ${controller.posts.value.id}'),
                Text('Title: ${controller.posts.value.title}'),
                Text('Body: ${controller.posts.value.body}'),
                // Tambahkan tampilan lainnya sesuai kebutuhan
              ],
            ),
          );
        } else {
          return Center(child: Text('No data available'));
        }
      }),
    );
  }
}
