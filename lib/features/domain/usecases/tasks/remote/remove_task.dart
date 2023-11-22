import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/task_repository.dart';

class RemoveTaskUseCase implements UseCase<DataState<void>, String> {
  final TaskRepository _taskRepository;

  RemoveTaskUseCase(this._taskRepository);

  @override
  Future<DataState<void>> call({String? params}) {
    return _taskRepository.deleteTask(params!);
  }
}
