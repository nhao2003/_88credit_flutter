import 'package:_88credit_flutter/features/domain/entities/task/task.dart';
import '../../../../core/resources/data_state.dart';

abstract class TaskRepository {
  // API remote
  Future<DataState<List<TaskEntity>>> getTasks();
  Future<DataState<TaskEntity>> getTask(String id);
  Future<DataState<void>> createTask(TaskEntity task);
  Future<DataState<void>> updateTask(TaskEntity task);
  Future<DataState<void>> deleteTask(String id);

  // database local
  Future<List<TaskEntity>> getTasksLocal();

  Future<void> saveTaskLocal(TaskEntity task);

  Future<void> removeTaskLocal(TaskEntity task);
}
