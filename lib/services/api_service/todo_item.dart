class TodoItem {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime? doneAt;

  TodoItem({
    this.id = 0,
    required this.title,
    required this.content,
    required this.createdAt,
    this.doneAt,
  });

  TodoItem copyWith({
    int? id,
    DateTime? doneAt,
    bool nullDoneAt = false,
  }) {
    return TodoItem(
      id: id ?? this.id,
      title: title,
      content: content,
      createdAt: createdAt,
      doneAt: nullDoneAt ? null : (doneAt ?? this.doneAt),
    );
  }
}
