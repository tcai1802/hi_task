part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({
    this.splashState = StateEnum.init,
  });
  final StateEnum splashState;
  @override
  List<Object?> get props => [splashState];

  SplashState copyWith({
    StateEnum? stateEnum,
  }) {
    return SplashState(
      splashState: stateEnum ?? splashState,
    );
  }
}

final class SplashInitState extends SplashState {}

final class SplashLoadingState extends SplashState {}

final class SplashSuccessState extends SplashState {}

final class SplashFailedState extends SplashState {}
