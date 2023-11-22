import 'package:_88credit_flutter/features/data/models/tasks/task.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "task", primaryKeys: ["id"])
class TaskLocalModel {
  final String? id;
  final String? title;
  final int? date;
  final bool? done;

  TaskLocalModel({
    this.id,
    this.title,
    this.date,
    this.done,
  });

  factory TaskLocalModel.fromLocal(TaskModel model) {
    return TaskLocalModel(
      id: model.id,
      title: model.title,
      done: model.done,
      date: model.date!.millisecondsSinceEpoch,
    );
  }
}
