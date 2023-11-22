import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/entities/task/task.dart';
import 'package:_88credit_flutter/features/domain/repository/task_repository.dart';

class GetSingleTaskUseCase implements UseCase<DataState<TaskEntity>, String> {
  final TaskRepository _taskRepository;

  GetSingleTaskUseCase(this._taskRepository);

  @override
  Future<DataState<TaskEntity>> call({String? params}) {
    return _taskRepository.getTask(params!);
  }
}
