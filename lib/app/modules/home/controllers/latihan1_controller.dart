import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_modul_6/app/data/model_data.dart';

class Latihan1_Controller extends GetxController {
  var posts = Posts(userId: 0, id: 0, title: '', body: '').obs;
  var isLoading = true.obs;
  http.Client? httpClient; // tambahkan httpClient di sini

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      final response = await (httpClient ?? http.Client())
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        posts(Posts.fromJson(data));
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
