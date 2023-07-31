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
}

class OnChangeDesEvent extends EditTaskEvent {
  final String description;
  const OnChangeDesEvent(this.description);
}

class OnChangeTodoList extends EditTaskEvent {
  final List<TodoModel> todoList;
  const OnChangeTodoList(this.todoList);
}

class SubmitEditEvent extends EditTaskEvent {
  final TaskModel taskModel;
  const SubmitEditEvent(this.taskModel);
}
