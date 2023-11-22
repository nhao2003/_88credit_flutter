import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/entities/task/task.dart';
import 'package:_88credit_flutter/features/domain/repository/task_repository.dart';

class UpdateTaskUseCase implements UseCase<DataState<void>, TaskEntity> {
  final TaskRepository _taskRepository;

  UpdateTaskUseCase(this._taskRepository);

  @override
  Future<DataState<void>> call({TaskEntity? params}) {
    return _taskRepository.updateTask(params!);
  }
}
