import 'package:freezed_annotation/freezed_annotation.dart';

import 'todo_status.dart';

part 'vo_todo.g.dart';

@JsonSerializable()
class Todo {
  Todo({
    required this.id,
    required this.title,
    required this.dueDate,
    this.modifyTime,
    TodoStatus? status,
    DateTime? createdTime,
  })  : createdTime = createdTime ?? DateTime.now(),
        status = status ?? TodoStatus.incomplete;

  int id;
  String title;
  final DateTime createdTime;
  DateTime? modifyTime;
  DateTime dueDate;
  TodoStatus status;

  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
