import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hi_task/src/models/task_model/exports.dart';
import 'package:hi_task/src/packages/task_repository.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeInitEvent>(_onHomeInitEvent);
    on<HomeLoadingEvent>(_onHomeLoadingEvent);
  }
  _onHomeInitEvent(
    HomeInitEvent event,
    Emitter<HomeState> emit,
  ) async {
    final nowTime = DateTime.now();
    emit(state.copyWith(
      priorityTaskStatus: PriorityTaskStatusEnum.loading,
      dailyTaskStatus: DailyTaskStatusEnum.loading,
      firstInit: false,
    ));
    Future.delayed(const Duration(seconds: 2));

    await TaskRepository().getTaskInADay(
      taskTypeEnum: TaskTypeEnum.priorityTask,
      onSuccess: (List<TaskModel> data) {
        emit(state.copyWith(priorityTaskList: data));

        emit(state.copyWith(
            priorityTaskStatus: PriorityTaskStatusEnum.complete));
      },
      onError: (String error) {
        emit(state.copyWith(priorityTaskStatus: PriorityTaskStatusEnum.failed));
      },
      startTime: DateTime.utc(nowTime.year, nowTime.month, nowTime.day),
      endTime:
          DateTime.utc(nowTime.year, nowTime.month, nowTime.day, 24, 00, 00),
    );
    await TaskRepository().getTaskInADay(
      taskTypeEnum: TaskTypeEnum.dailyTask,
      onSuccess: (List<TaskModel> data) {
        emit(state.copyWith(dailyTaskList: data));
        emit(state.copyWith(dailyTaskStatus: DailyTaskStatusEnum.complete));
      },
      onError: (String error) {
        emit(state.copyWith(dailyTaskStatus: DailyTaskStatusEnum.failed));
      },
      startTime: DateTime.utc(nowTime.year, nowTime.month, nowTime.day),
      endTime:
          DateTime.utc(nowTime.year, nowTime.month, nowTime.day, 24, 00, 00),
    );

    Future.delayed(const Duration(seconds: 2));
  }

  _onHomeLoadingEvent(
    HomeLoadingEvent event,
    Emitter<HomeState> emit,
  ) {
    //print("==== Loading event");
  }
}
