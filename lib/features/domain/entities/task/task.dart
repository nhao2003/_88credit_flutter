import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TaskEntity extends Equatable {
  final String? id;
  final String? title;
  final DateTime? date;
  final bool? done;
  final Color? color;

  const TaskEntity({
    this.id,
    this.title,
    this.done,
    this.date,
    this.color,
  });

  @override
  List<Object?> get props => [id, title, done, date];

  TaskEntity copyWith({
    String? id,
    String? title,
    DateTime? date,
    bool? done,
    Color? color,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      done: done ?? this.done,
      color: color ?? this.color,
    );
  }
}
