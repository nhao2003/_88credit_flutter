import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/entities/task/task.dart';
import 'package:_88credit_flutter/features/domain/repository/task_repository.dart';

class SaveLocalTasksUseCase implements UseCase<void, TaskEntity> {
  final TaskRepository _taskRepository;

  SaveLocalTasksUseCase(this._taskRepository);

  @override
  Future<void> call({TaskEntity? params}) {
    return _taskRepository.saveTaskLocal(params!);
  }
}
