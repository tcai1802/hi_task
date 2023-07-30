import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String content;
  final bool isCompleted;
  const TodoModel({
    this.content = "",
    this.isCompleted = false,
  });
  Map<String, dynamic> toMap(TodoModel todoModel) => {
        "content": todoModel.content,
        "isCompleted": todoModel.isCompleted,
      };
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      content: json["content"],
      isCompleted: json["isCompleted"],
    );
  }
  @override
  List<Object?> get props => [content, isCompleted];
}
