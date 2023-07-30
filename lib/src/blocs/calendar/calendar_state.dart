part of 'calendar_bloc.dart';

class CalendarState extends Equatable {
  final bool isFirstInit;
  final int currentTabIndex;
  final DateTime? currentTime;
  final List<TaskModel> dailyTaskList;
  final List<TaskModel> priorityTaskList;
  final DailyTaskStatusEnum dailyTaskStatus;
  final PriorityTaskStatusEnum priorityTaskStatus;

  const CalendarState({
    this.isFirstInit = true,
    this.currentTabIndex = 0,
    this.currentTime,
    this.dailyTaskList = const [],
    this.priorityTaskList = const [],
    this.dailyTaskStatus = DailyTaskStatusEnum.init,
    this.priorityTaskStatus = PriorityTaskStatusEnum.init,
  });

  CalendarState copyWith({
    bool? isFirstInit,
    int? currentTabIndex,
    DateTime? currentTime,
    List<TaskModel>? priorityTaskList,
    List<TaskModel>? dailyTaskList,
    DailyTaskStatusEnum? dailyTaskStatus,
    PriorityTaskStatusEnum? priorityTaskStatus,
  }) {
    return CalendarState(
      currentTime: currentTime ?? this.currentTime,
      dailyTaskList: dailyTaskList ?? this.dailyTaskList,
      priorityTaskList: priorityTaskList ?? this.priorityTaskList,
      dailyTaskStatus: dailyTaskStatus ?? this.dailyTaskStatus,
      priorityTaskStatus: priorityTaskStatus ?? this.priorityTaskStatus,
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      isFirstInit: isFirstInit ?? this.isFirstInit,
    );
  }

  @override
  List get props => [
        currentTabIndex,
        currentTime,
        dailyTaskList,
        priorityTaskList,
        dailyTaskStatus,
        priorityTaskStatus,
        isFirstInit
      ];
}
