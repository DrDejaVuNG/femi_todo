class TodoModel {
  TodoModel({
    required this.id,
    required this.title,
    required this.text,
    required this.created,
  });

  final String id;
  final String title;
  final String text;
  final String created;

  TodoModel copyWith({
    String? id,
    String? title,
    String? text,
    String? created,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      text: text ?? this.text,
      created: created ?? this.created,
    );
  }
}
