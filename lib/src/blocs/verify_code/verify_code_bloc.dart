import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'verify_code_event.dart';
part 'verify_code_state.dart';

class VerifyCodeBloc extends Bloc<VerifyCodeEvent, VerifyCodeState> {
  VerifyCodeBloc() : super(const VerifyCodeState()) {
    on<OnSendVerifyCodeEvent>(_onSendVerifyCodeEvent);
    on<OnVerifyInitEvent>(_onVerifyInitEvent);
    on<OnVerifyProgressingEvent>(_onVerifyProgressingEvent);
    on<OnVerifyCompleteEvent>(
      _onVerifyCompleteEvent,
    );
  }
  StreamSubscription<int>? _tickerSubscription;
  static const _duration = 60;
  @override
  Future<void> close() {
    print("Bloc dispose");
    _tickerSubscription?.cancel();
    return super.close();
  }

  _onSendVerifyCodeEvent(
    OnSendVerifyCodeEvent event,
    Emitter<VerifyCodeState> emit,
  ) {}

  _onVerifyInitEvent(
    OnVerifyInitEvent event,
    Emitter<VerifyCodeState> emit,
  ) {
    _tickerSubscription?.cancel();
    _tickerSubscription = tick(ticks: _duration).listen(
      (duration) {
        print("====${FirebaseAuth.instance.currentUser?.emailVerified}");
        FirebaseAuth.instance.currentUser?.reload();
        FirebaseAuth.instance.authStateChanges().listen((event) {
          if (event != null && event.emailVerified) {
            add(const OnVerifyCompleteEvent(_duration));
            _tickerSubscription?.cancel();
          }
        });
        add(OnVerifyProgressingEvent(duration));
      },
    );
  }

  Stream<int> tick({required int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }

  _onVerifyProgressingEvent(
    OnVerifyProgressingEvent event,
    Emitter<VerifyCodeState> emit,
  ) async {
    if (event.duration <= 0) {
      emit(state.copyWith(
        duration: _duration,
      ));
    } else {
      emit(state.copyWith(
        duration: event.duration,
      ));
    }
  }

  _onVerifyCompleteEvent(
    OnVerifyCompleteEvent event,
    Emitter<VerifyCodeState> emit,
  ) {
    emit(state.copyWith(
      duration: event.duration,
      isVerified: true,
    ));
  }
}
