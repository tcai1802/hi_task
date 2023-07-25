part of 'verify_code_bloc.dart';

class VerifyCodeState extends Equatable {
  final bool isVerified;
  final int duration;

  const VerifyCodeState({
    this.isVerified = false,
    this.duration = 60,
  });
  @override
  List<Object?> get props => [isVerified, duration];

  VerifyCodeState copyWith({
    bool? isVerified,
    int? duration,
  }) {
    return VerifyCodeState(
      isVerified: isVerified ?? this.isVerified,
      duration: duration ?? this.duration,
    );
  }
}

final class VerifyCodeInitial extends VerifyCodeState {
  const VerifyCodeInitial();
}

class VerifyCodeProgressing extends VerifyCodeState {
  const VerifyCodeProgressing();

  //@override
  //List<Object?> get props => super.props;
}

class VerifyCodeSuccessfully extends VerifyCodeState {
  const VerifyCodeSuccessfully();
}
