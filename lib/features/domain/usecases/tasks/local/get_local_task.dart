import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/entities/task/task.dart';
import 'package:_88credit_flutter/features/domain/repository/task_repository.dart';

class GetLocalTasksUseCase implements UseCase<List<TaskEntity>, void> {
  final TaskRepository _taskRepository;

  GetLocalTasksUseCase(this._taskRepository);

  @override
  Future<List<TaskEntity>> call({void params}) {
    return _taskRepository.getTasksLocal();
  }
}
