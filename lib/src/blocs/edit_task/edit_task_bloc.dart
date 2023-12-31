import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hi_task/src/blocs/add_task/add_task_bloc.dart';
import 'package:hi_task/src/models/model_exports.dart';
import 'package:hi_task/src/packages/task_repository.dart';

part 'edit_task_event.dart';
part 'edit_task_state.dart';

class EditTaskBloc extends Bloc<EditTaskEvent, EditTaskState> {
  EditTaskBloc() : super(const EditTaskState()) {
    on<OnInitDataEvent>(_onInitDataEvent);
    on<OnChangeTitleEvent>(_onChangeTitleEvent);
    on<OnChangeDesEvent>(_onChangeDesEvent);
    on<OnChangeStartDateEvent>(_onChangeStartDateEvent);
    on<OnChangeEndDateEvent>(_onChangeEndDateEvent);
    on<SubmitEditEvent>(_onSubmitEditEvent);
    on<OnEditAddTodoEvent>(_onAddTodoEvent);
    on<OnEditEditTodoEvent>(_onEditTodoEvent);
    on<OnEditDelTodoEvent>(_onDelTodoEvent);
    on<OnChangeTodoItemStatusEvent>(_onChangeTodoItemStatusEvent);
  }

  _onChangeTodoItemStatusEvent(
    OnChangeTodoItemStatusEvent event,
    Emitter<EditTaskState> emit,
  ) {
    final List<TodoModel> newTodoList = List.from(state.todoList);
    newTodoList[event.indexTodo] = newTodoList[event.indexTodo]
        .copyWith(isCompleted: !newTodoList[event.indexTodo].isCompleted);
    emit(
      state.copyWith(
        todoList: newTodoList,
      ),
    );
  }

  _onAddTodoEvent(
    OnEditAddTodoEvent event,
    Emitter<EditTaskState> emit,
  ) {
    emit(
      state.copyWith(
        todoList: [...state.todoList, event.todoModel],
      ),
    );
  }

  _onEditTodoEvent(
    OnEditEditTodoEvent event,
    Emitter<EditTaskState> emit,
  ) {
    final List<TodoModel> newTodoList = List.from(state.todoList);
    newTodoList[event.index] = event.todoModel;
    emit(
      state.copyWith(
        todoList: newTodoList,
      ),
    );
  }

  _onDelTodoEvent(
    OnEditDelTodoEvent event,
    Emitter<EditTaskState> emit,
  ) {
    final List<TodoModel> newTodoList = List.from(state.todoList);
    newTodoList.removeAt(event.index);

    emit(state.copyWith(todoList: newTodoList));
  }

  _onInitDataEvent(OnInitDataEvent event, Emitter<EditTaskState> emit) {
    emit(
      state.copyWith(
        title: event.taskModel.title,
        description: event.taskModel.description,
        startDate: event.taskModel.startDate,
        endDate: event.taskModel.endDate,
        todoList: event.taskModel.todoList,
      ),
    );
  }

  _onChangeTitleEvent(OnChangeTitleEvent event, Emitter<EditTaskState> emit) {
    emit(state.copyWith(title: event.title));
  }

  _onChangeDesEvent(OnChangeDesEvent event, Emitter<EditTaskState> emit) {
    emit(state.copyWith(title: event.description));
  }

  _onChangeStartDateEvent(
      OnChangeStartDateEvent event, Emitter<EditTaskState> emit) {
    emit(state.copyWith(startDate: event.startTime));
  }

  _onChangeEndDateEvent(
      OnChangeEndDateEvent event, Emitter<EditTaskState> emit) {
    emit(state.copyWith(endDate: event.endTime));
  }

  _onSubmitEditEvent(SubmitEditEvent event, Emitter<EditTaskState> emit) async {
    if (state.title.isNotEmpty &&
        state.description.isNotEmpty &&
        state.startDate != null &&
        state.endDate != null) {
      if (state.endDate!.isBefore(
        state.startDate!,
      )) {
        emit(
          state.copyWith(
            ediTaskStatus: AddTaskStatusEnum.failure,
            message: "End time must be greater than start time",
          ),
        );
      } else {
        final TaskModel newModel = TaskModel(
          title: state.title,
          description: state.description,
          startDate: state.startDate,
          endDate: state.endDate,
          todoList: state.todoList,
        );
        emit(state.copyWith(ediTaskStatus: AddTaskStatusEnum.loading));
        await TaskRepository().editTaskApi(
          event.taskModel.taskId!,
          data: UpdateTaskRequest().toMap(newModel),
          onSuccess: (String message) {
            emit(state.copyWith(ediTaskStatus: AddTaskStatusEnum.success));
          },
          onError: (String error) {
            emit(state.copyWith(ediTaskStatus: AddTaskStatusEnum.failure));
          },
        );
      }
    } else {
      emit(
        state.copyWith(
            ediTaskStatus: AddTaskStatusEnum.failure,
            message: "Please enter full information"),
      );
    } 
    emit(
      state.copyWith(
        ediTaskStatus: AddTaskStatusEnum.init,
        message: "",
      ),
    );
  }
}
