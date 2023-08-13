import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hi_task/src/models/model_exports.dart';
import 'package:hi_task/src/packages/task_repository.dart';

part 'statistic_event.dart';
part 'statistic_state.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  StatisticBloc() : super(const StatisticInitial()) {
    on<StatisticEvent>((event, emit) {});
    on<InitDataEvent>(_initDataEvent);
  }
  _initDataEvent(
    InitDataEvent event,
    Emitter<StatisticState> emit,
  ) async {
    emit(state.copyWith(
      currentYear: event.selectedYear,
    ));
    await TaskRepository().getTaskInAYear(
      onSuccess: (data) {
        emit(state.copyWith(
          taskModelList: data,
        ));
      },
      onError: (error) {
      },
      selectedYear: event.selectedYear,
    );
  }

  // Other function
  List<TaskModel> handleGetTotalTaskInMonth({
    required int month,
  }) {
    final DateTime selectedTime = DateTime.utc(state.currentYear!, month);
    DateTime lastday = DateTime(selectedTime.year, selectedTime.month + 1, 0);
    return state.taskModelList
        .where((element) => element.startDate!.isAfter(selectedTime) && element.startDate!.isBefore(lastday))
        .toList();
  }
}
