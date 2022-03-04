class TodoModel {
  String id;
  String title;
  DateTime createdAt;
  bool isCompleted;
  TodoModel(
      {required this.id,
      required this.createdAt,
      required this.isCompleted,
      required this.title});
}
