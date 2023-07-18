part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({
    this.splashState = StateEnum.init,
    this.firstOpenAppState = false,
  });
  final StateEnum splashState;
  final bool firstOpenAppState;
  @override
  List<Object?> get props => [splashState, firstOpenAppState];

  SplashState copyWith({
    StateEnum? stateEnum,
    bool? firstOpenApp,
  }) {
    return SplashState(
      splashState: stateEnum ?? splashState,
      firstOpenAppState: firstOpenApp ?? firstOpenAppState,
    );
  }
}

final class SplashInitState extends SplashState {}

final class SplashLoadingState extends SplashState {}

final class SplashSuccessState extends SplashState {}

final class SplashFailedState extends SplashState {}
