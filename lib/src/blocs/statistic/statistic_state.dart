part of 'statistic_bloc.dart';

class StatisticState extends Equatable {
  //const StatisticState();
  final int? currentYear;
  final List<TaskModel> taskModelList;
  const StatisticState({
    this.currentYear,
    this.taskModelList = const <TaskModel>[],
  });
  StatisticState copyWith({
    int? currentYear,
    List<TaskModel>? taskModelList,
  }) {
    return StatisticState(
      currentYear: currentYear ?? this.currentYear,
      taskModelList: taskModelList ?? this.taskModelList,
    );
  }

  @override
  List<Object?> get props => [currentYear, taskModelList];
}

class StatisticInitial extends StatisticState {
  const StatisticInitial();
}
