part of 'verify_code_bloc.dart';

class VerifyCodeEvent extends Equatable {
  const VerifyCodeEvent();

  @override
  List<Object?> get props => [];
}

class OnSendVerifyCodeEvent extends VerifyCodeEvent {
  const OnSendVerifyCodeEvent();
}

class OnVerifyInitEvent extends VerifyCodeEvent {
  //const OnVerifyInitEvent(this.duration);
  //final int duration;
}

class OnVerifyStartedEvent extends VerifyCodeEvent {
  const OnVerifyStartedEvent();
}

class OnVerifyProgressingEvent extends VerifyCodeEvent {
  const OnVerifyProgressingEvent(this.duration);
  final int duration;
}

class OnVerifyCompleteEvent extends VerifyCodeEvent {
  const OnVerifyCompleteEvent(this.duration);
  final int duration;
}
