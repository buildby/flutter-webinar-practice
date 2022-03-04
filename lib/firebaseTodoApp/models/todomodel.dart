class TodoModel {
  String title;
  DateTime createdAt;
  bool isCompleted;
  TodoModel(
      {required this.createdAt,
      required this.isCompleted,
      required this.title});
}
