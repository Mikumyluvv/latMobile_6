import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_modul_6/app/data/model_data.dart';
import 'package:latihan_modul_6/app/modules/home/controllers/latihan1_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_service.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('Latihan1_Controller Test', () {
    late Latihan1_Controller controller;
    late http.Client httpClient;

    setUp(() {
      httpClient = MockClient();
      controller = Latihan1_Controller();
    });

    test('fromJson() should return a valid Posts instance', () {
      // Arrange
      Map<String, dynamic> jsonData = {
        "userId": 1,
        "id": 1,
        "title":
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body":
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
      };

      // Act
      var posts = Posts.fromJson(jsonData);

      // Assert
      expect(posts, isA<Posts>());
      expect(posts.userId, equals(1));
      expect(posts.id, equals(1));
      expect(
          posts.title,
          equals(
              "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"));
      expect(
          posts.body,
          equals(
              "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"));
    });

    test('toJson() should return a Map with correct values', () {
      // Arrange
      var posts = Posts(
        userId: 1,
        id: 1,
        title:
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        body:
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
      );

      // Act
      var jsonMap = posts.toJson();

      // Assert
      expect(jsonMap, isA<Map<String, dynamic>>());
      expect(jsonMap["userId"], equals(1));
      expect(jsonMap["id"], equals(1));
      expect(
          jsonMap["title"],
          equals(
              "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"));
      expect(
          jsonMap["body"],
          equals(
              "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"));
    });

    test('Initial values are set correctly', () {
      expect(controller.posts.value.userId, 0);
      expect(controller.posts.value.id, 0);
      expect(controller.posts.value.title, '');
      expect(controller.posts.value.body, '');
      expect(controller.isLoading.value, true);
    });

    test('Fetching posts updates isLoading on failure', () async {
      when(httpClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')))
          .thenAnswer((_) async => http.Response('', 404));

      controller.fetchPosts(); // Remove the argument here

      expect(controller.isLoading.value, true);
    });
  });
}
