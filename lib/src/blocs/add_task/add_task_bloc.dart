import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hi_task/src/models/model_exports.dart';
import 'package:hi_task/src/packages/task_repository.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

enum AddTaskStatusEnum { init, loading, failure, success }

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(const AddTaskState()) {
    on<OnChangeTaskTypeEvent>(_onChangeTaskTypeEvent);
    on<OnChangeStartTimeEvent>(_onChangeStartTimeEvent);
    on<OnChangeEndTimeEvent>(_onChangeEndTimeEvent);
    on<OnAddTodoEvent>(_onAddTodoEvent);
    on<OnEditTodoEvent>(_onEditTodoEvent);
    on<OnDelTodoEvent>(_onDelTodoEvent);
    on<OnSubmitTaskEvent>(_onSubmitTaskEvent);
  }

  _onChangeTaskTypeEvent(
    OnChangeTaskTypeEvent event,
    Emitter<AddTaskState> emit,
  ) {
    emit(state.copyWith(taskTypeEnum: event.taskType));
  }

  _onChangeStartTimeEvent(
    OnChangeStartTimeEvent event,
    Emitter<AddTaskState> emit,
  ) {
    emit(state.copyWith(startTime: event.startTime));
  }

  _onChangeEndTimeEvent(
    OnChangeEndTimeEvent event,
    Emitter<AddTaskState> emit,
  ) {
    emit(state.copyWith(endTime: event.endTime));
  }

  _onAddTodoEvent(
    OnAddTodoEvent event,
    Emitter<AddTaskState> emit,
  ) {
    emit(
      state.copyWith(
        todoList: [...state.todoList, event.todoModel],
      ),
    );
    //print("Clmaaa ${state.todoList}");
  }

  _onEditTodoEvent(
    OnEditTodoEvent event,
    Emitter<AddTaskState> emit,
  ) {
    final List<TodoModel> newTodoList = List.from(state.todoList);
    newTodoList[event.index] = event.todoModel;
    emit(
      state.copyWith(
        todoList: newTodoList,
      ),
    );
    //print("Clmaaa ${state.todoList}");
  }

  _onDelTodoEvent(
    OnDelTodoEvent event,
    Emitter<AddTaskState> emit,
  ) {
    final List<TodoModel> newTodoList = List.from(state.todoList);
    newTodoList.removeAt(event.index);

    emit(state.copyWith(todoList: newTodoList));
  }

  _onSubmitTaskEvent(
    OnSubmitTaskEvent event,
    Emitter<AddTaskState> emit,
  ) async {
    if (event.taskModel.title != null &&
        event.taskModel.description != null &&
        event.taskModel.startDate != null &&
        event.taskModel.endDate != null) {
      if (event.taskModel.endDate!.isBefore(
        event.taskModel.startDate!,
      )) {
        emit(
          state.copyWith(
              addTaskStatusEnum: AddTaskStatusEnum.failure,
              message: "End time must be greater than start time"),
        );
      } else {
        emit(state.copyWith(addTaskStatusEnum: AddTaskStatusEnum.loading));
        await TaskRepository().createTaskApi(
          event.taskModel,
          onSuccess: () {
            emit(state.copyWith(addTaskStatusEnum: AddTaskStatusEnum.success));
          },
          onError: (String error) {
            emit(state.copyWith(addTaskStatusEnum: AddTaskStatusEnum.failure));
          },
        );
      }
    } else {
      emit(
        state.copyWith(
            addTaskStatusEnum: AddTaskStatusEnum.failure,
            message: "Please enter full information"),
      );
      //print("Vui lòng nhập đầy đủ thông tin");
    }
    emit(
      state.copyWith(
        addTaskStatusEnum: AddTaskStatusEnum.init,
        message: "",
      ),
    );
  }
}
