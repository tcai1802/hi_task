part of 'home_bloc.dart';

enum HomeStatusEnum { init, loading, complete, failed }

enum DailyTaskStatusEnum { init, loading, complete, failed }

enum PriorityTaskStatusEnum { init, loading, complete, failed }

class HomeState extends Equatable {
  final List<TaskModel>? priorityTaskList;
  final List<TaskModel>? dailyTaskList;
  final HomeStatusEnum homeStatusEnum;
  final PriorityTaskStatusEnum priorityTaskStatus;
  final DailyTaskStatusEnum dailyTaskStatus;
  final bool firstInit;
  const HomeState({
    this.priorityTaskList,
    this.dailyTaskList,
    this.homeStatusEnum = HomeStatusEnum.init,
    this.priorityTaskStatus = PriorityTaskStatusEnum.init,
    this.dailyTaskStatus = DailyTaskStatusEnum.init,
    this.firstInit = true,
  });

  HomeState copyWith({
    List<TaskModel>? priorityTaskList,
    List<TaskModel>? dailyTaskList,
    HomeStatusEnum? homeStatusEnum,
    PriorityTaskStatusEnum? priorityTaskStatus,
    DailyTaskStatusEnum? dailyTaskStatus,
    bool? firstInit,
  }) {
    return HomeState(
      priorityTaskList: priorityTaskList ?? this.priorityTaskList,
      dailyTaskList: dailyTaskList ?? this.dailyTaskList,
      homeStatusEnum: homeStatusEnum ?? this.homeStatusEnum,
      priorityTaskStatus: priorityTaskStatus ?? this.priorityTaskStatus,
      dailyTaskStatus: dailyTaskStatus ?? this.dailyTaskStatus,
      firstInit: firstInit ?? this.firstInit,
    );
  }

  @override
  List<Object?> get props => [
        priorityTaskList,
        dailyTaskList,
        homeStatusEnum,
        priorityTaskStatus,
        dailyTaskStatus,
      ];
}
