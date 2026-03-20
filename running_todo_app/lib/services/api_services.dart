import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo.dart';

class ApiService {
  static const String baseUrl = 'https://apimocker.com/todos';

  Future<List<Todo>> fetchTodos({required int page, int limit = 10}) async {
    final uri = Uri.parse('$baseUrl?page=$page&limit=$limit');
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final List data = json.decode(res.body) as List;
      return data.map((e) => Todo.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<Todo> createTodo({required String title, required String description}) async {
    final uri = Uri.parse(baseUrl);
    final body = json.encode({'title': title, 'description': description, 'completed': false, 'createdAt': DateTime.now().toIso8601String()});
    final res = await http.post(uri, headers: {'Content-Type': 'application/json'}, body: body);
    if (res.statusCode == 201 || res.statusCode == 200) {
      return Todo.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to create todo');
    }
  }

  Future<void> toggleTodo(String id, bool done) async {
    final uri = Uri.parse('$baseUrl/$id');
    final res = await http.patch(uri, headers: {'Content-Type': 'application/json'}, body: json.encode({'completed': done}));
    if (res.statusCode != 200 && res.statusCode != 204) {
      throw Exception('Failed to update todo');
    }
  }
}
