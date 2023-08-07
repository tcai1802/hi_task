import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hi_task/src/models/model_exports.dart';
import 'package:hi_task/src/packages/task_repository.dart';

part 'priority_task_details_event.dart';
part 'priority_task_details_state.dart';

class PriorityTaskDetailsBloc extends Bloc<PriorityTaskDetailsEvent, PriorityTaskDetailsState> {
  PriorityTaskDetailsBloc() : super(const PriorityTaskDetailsInitial()) {
    on<InitPriorityTaskDetailsEvent>(_onInitPriTaskDetailsEvent);
    on<OnChangeTimeEvent>(_onChangeTimeEvent);
    on<OnCompleteOrNotTodoEvent>(_onCompleteOrNotTodoEvent);
  }
  StreamSubscription<int>? _tickerSubscription;
  StreamSubscription<void>? streamData;

  _onCompleteOrNotTodoEvent(
    OnCompleteOrNotTodoEvent event,
    Emitter<PriorityTaskDetailsState> emit,
  ) {
    streamData?.cancel();
    final List<TodoModel> newTodoList = List.from(state.todoList);
    final newTodo = newTodoList[event.index].copyWith(isCompleted: event.isCompleted);

    newTodoList[event.index] = newTodo;

    emit(state.copyWith(todoList: newTodoList));
    streamData = Stream<void>.fromFuture(waitTask()).listen((event) {
      TaskRepository().editTaskApi(
        state.taskModel!.taskId!,
        onSuccess: (message) {
          //print("Cập nhật thành công");
        },
        onError: (error) {
          //print("Cập nhật thất bại");
        },
        data: UpdateTodoRequest().toMap(state.todoList),
      );
    });
  }

  Future<void> waitTask() async {
    return await Future.delayed(const Duration(seconds: 2));
  }

  _onChangeTimeEvent(
    OnChangeTimeEvent event,
    Emitter<PriorityTaskDetailsState> emit,
  ) {
    //String data2 = intToTimeLeft(event.second);
    //print("TIME: ${data2}");
    emit(state.copyWith(second: event.second));
  }

  _onInitPriTaskDetailsEvent(
    InitPriorityTaskDetailsEvent event,
    Emitter<PriorityTaskDetailsState> emit,
  ) async {
    final TaskModel? data = await TaskRepository().handleGetTaskDetail(event.taskId);
    if (data != null) {
      emit(state.copyWith(
        taskModel: data,
        todoList: data.todoList,
      ));
    }
    final data2 = state.taskModel!.endDate!.difference(DateTime.now());
    //print("Range time${data2.inDays}");
    _tickerSubscription?.cancel();
    _tickerSubscription = tick(ticks: data2.inSeconds).listen(
      (duration) async {
        if (duration <= 0) {
          _tickerSubscription?.cancel();
          return;
        }
        add(OnChangeTimeEvent(duration));
      },
    );
  }

  List<String> intToTimeLeft(int value) {
    int diff = value;

    int days = diff ~/ (24 * 60 * 60);
    diff -= days * (24 * 60 * 60);
    int hours = diff ~/ (60 * 60);
    diff -= hours * (60 * 60);
    int minutes = diff ~/ (60);
    diff -= minutes * (60);

    //String result = "${twoDigitNumber(days)}:${twoDigitNumber(hours)}:${twoDigitNumber(minutes)}";

    return [twoDigitNumber(days), twoDigitNumber(hours), twoDigitNumber(minutes)];
  }

  @override
  Future<void> close() async {
    //cancel streams\
    _tickerSubscription?.cancel();
    super.close();
  }

  static String twoDigitNumber(int? dateTimeNumber) {
    if (dateTimeNumber == null) return "0";
    return dateTimeNumber < 10 ? "0$dateTimeNumber" : dateTimeNumber.toString();
  }

  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) {
      //print("Tick: $ticks === X: $x");
      return ticks - x;
    }).take(ticks);
  }
}
