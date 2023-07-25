part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({
    this.splashState = StateEnum.init,
    this.firstOpenAppState = false,
    this.isLogged = false,
  });

  final StateEnum splashState;
  final bool firstOpenAppState;
  final bool isLogged;

  @override
  List<Object?> get props => [splashState, firstOpenAppState, isLogged];

  SplashState copyWith({
    StateEnum? splashState,
    bool? firstOpenAppState,
    bool? isLogged,
  }) {
    return SplashState(
      firstOpenAppState: firstOpenAppState ?? this.firstOpenAppState,
      isLogged: isLogged ?? this.isLogged,
      splashState: splashState ?? this.splashState,
    );
  }
}

final class SplashInitState extends SplashState {}

final class SplashLoadingState extends SplashState {
  const SplashLoadingState();
}

final class SplashSuccessState extends SplashState {}

final class SplashFailedState extends SplashState {}