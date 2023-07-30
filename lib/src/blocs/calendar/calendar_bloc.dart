import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hi_task/src/blocs/blocs_exports.dart';
import 'package:hi_task/src/blocs/home/home_bloc.dart';
import 'package:hi_task/src/models/task_model/exports.dart';
import 'package:hi_task/src/packages/task_repository.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarState()) {
    on<CalendarInitEvent>(_onCalendarInitEvent);
    on<OnChangeIndexTabEvent>(_onChangeTabIndexEvent);
  }

  _onCalendarInitEvent(
    CalendarInitEvent event,
    Emitter<CalendarState> emit,
  ) async {
    emit(state.copyWith(
      priorityTaskStatus: PriorityTaskStatusEnum.loading,
      dailyTaskStatus: DailyTaskStatusEnum.loading,
      currentTime: event.currentTime,
      isFirstInit: false,
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
      startTime: DateTime.utc(
        state.currentTime!.year,
        state.currentTime!.month,
        state.currentTime!.day,
      ),
      endTime: DateTime.utc(
        state.currentTime!.year,
        state.currentTime!.month,
        state.currentTime!.day,
        24,
        00,
        00,
      ),
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
      startTime: DateTime.utc(state.currentTime!.year, state.currentTime!.month,
          state.currentTime!.day),
      endTime: DateTime.utc(state.currentTime!.year, state.currentTime!.month,
          state.currentTime!.day, 24, 00, 00),
    );
  }

  _onChangeTabIndexEvent(
    OnChangeIndexTabEvent event,
    Emitter<CalendarState> emit,
  ) {
    print("Index: ${event.currentTabIndex}");
    emit(
      state.copyWith(currentTabIndex: event.currentTabIndex),
    );
  }
}
