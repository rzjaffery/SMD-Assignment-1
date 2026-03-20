class Todo {
  final String id;
  final String title;
  final String description;
  final bool done;
  final DateTime createdAt;

  Todo({required this.id, required this.title, required this.description, required this.done, required this.createdAt});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      done: json['completed'] ?? json['done'] ?? false,
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? json['created_at']?.toString() ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'completed': done,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
