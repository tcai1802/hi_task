part of 'edit_task_bloc.dart';

class EditTaskEvent extends Equatable {
  const EditTaskEvent();

  @override
  List<Object> get props => [];
}

class OnInitDataEvent extends EditTaskEvent {
  final TaskModel taskModel;
  const OnInitDataEvent(this.taskModel);
}

class OnChangeTitleEvent extends EditTaskEvent {
  final String title;
  const OnChangeTitleEvent(this.title);
}

class OnChangeStartDateEvent extends EditTaskEvent {
  final DateTime startTime;
  const OnChangeStartDateEvent(this.startTime);
}

class OnChangeEndDateEvent extends EditTaskEvent {
  final DateTime endTime;
  const OnChangeEndDateEvent(this.endTime);
  @override
  List<Object> get props => [endTime];
}

class OnChangeDesEvent extends EditTaskEvent {
  final String description;
  const OnChangeDesEvent(this.description);

  @override
  List<Object> get props => [description];
}

class OnChangeTodoList extends EditTaskEvent {
  final List<TodoModel> todoList;
  const OnChangeTodoList(this.todoList);
}

class OnEditAddTodoEvent extends EditTaskEvent {
  final TodoModel todoModel;
  const OnEditAddTodoEvent(this.todoModel);

  @override
  List<Object> get props => [todoModel];
}

class OnEditEditTodoEvent extends EditTaskEvent {
  final TodoModel todoModel;
  final int index;
  const OnEditEditTodoEvent(this.todoModel, this.index);

  @override
  List<Object> get props => [todoModel];
}

class OnEditDelTodoEvent extends EditTaskEvent {
  final int index;
  const OnEditDelTodoEvent(this.index);

  @override
  List<Object> get props => [index];
}

class SubmitEditEvent extends EditTaskEvent {
  final TaskModel taskModel;
  const SubmitEditEvent(this.taskModel);
}

class OnChangeTodoItemStatusEvent extends EditTaskEvent {
  final int indexTodo;
  final bool isCompleted;
  const OnChangeTodoItemStatusEvent(this.indexTodo, this.isCompleted);
  @override
  List<Object> get props => [indexTodo, isCompleted];
}
