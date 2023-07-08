import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarEnum.home, 0));

  void getNavBarItem(NavbarEnum navbarEnum) {
    switch (navbarEnum) {
      case NavbarEnum.home:
        emit(const NavigationState(NavbarEnum.home, 0));
        break;
      case NavbarEnum.calendarPriority:
        emit(const NavigationState(NavbarEnum.calendarPriority, 1));

        break;
      case NavbarEnum.profile:
        emit(const NavigationState(NavbarEnum.profile, 2));
        break;
    }
  }
}
