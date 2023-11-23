
class TodoModel {
  final String title;
  final String description;
  DateTime? createTodo;

  TodoModel({
    required this.title,
    required this.description,
  }): createTodo = DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'createTodo': createTodo,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }
}
