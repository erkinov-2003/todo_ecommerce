class TodoModel {
  final String title;
  final String description;
  final DateTime? dateTime;

  TodoModel({
    required this.title,
    required this.description,
  }): dateTime = DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }
}
