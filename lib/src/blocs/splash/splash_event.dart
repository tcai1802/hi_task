part of 'splash_bloc.dart';

class SplashEvent {
  const SplashEvent();
}

final class SplashInitEvent extends SplashEvent {}
final class SplashLoadingEvent extends SplashEvent{}
final class SplashSuccessEvent extends SplashEvent {}
final class SplashFailedEvent extends SplashEvent {}
