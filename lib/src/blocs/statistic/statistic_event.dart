part of 'statistic_bloc.dart';

abstract class StatisticEvent extends Equatable {
  const StatisticEvent();

  @override
  List<Object> get props => [];
}

class InitDataEvent extends StatisticEvent {
  const InitDataEvent(this.selectedYear);
  final int selectedYear;

  @override
  List<Object> get props => [selectedYear];
}
