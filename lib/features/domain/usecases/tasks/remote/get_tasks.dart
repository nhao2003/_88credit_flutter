import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/entities/task/task.dart';
import 'package:_88credit_flutter/features/domain/repository/task_repository.dart';

class GetTasksUseCase implements UseCase<DataState<List<TaskEntity>>, void> {
  final TaskRepository _taskRepository;

  GetTasksUseCase(this._taskRepository);

  @override
  Future<DataState<List<TaskEntity>>> call({void params}) {
    return _taskRepository.getTasks();
  }
}
