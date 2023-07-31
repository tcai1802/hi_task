part of 'calendar_bloc.dart';

class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object> get props => [];
}

class CalendarInitEvent extends CalendarEvent {
  final DateTime currentTime;
  const CalendarInitEvent(this.currentTime);
}

class OnChangeIndexTabEvent extends CalendarEvent {
  final int currentTabIndex;
  const OnChangeIndexTabEvent(this.currentTabIndex);
}

class OnDeleteClickEvent extends CalendarEvent {
  final String taskId;
  const OnDeleteClickEvent(this.taskId);
}
