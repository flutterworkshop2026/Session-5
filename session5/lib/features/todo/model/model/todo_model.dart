class TodoModel {
  final int? id;
  final String title;
  bool isDone;
  TodoModel({
    this.id,
    required this.title,
    this.isDone = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      isDone: json['completed'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'completed': isDone,
    };
  }
}
