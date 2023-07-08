part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  final NavbarEnum navBarEnum;
  final int index;
  const NavigationState(this.navBarEnum, this.index);

  @override
  List<Object?> get props => [navBarEnum, index];
}
