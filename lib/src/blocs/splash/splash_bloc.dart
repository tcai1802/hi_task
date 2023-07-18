import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hi_task/firebase_options.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashInitEvent>(_onInitEvent);
  }
  Future<void> _onInitEvent(
    SplashInitEvent event,
    Emitter<SplashState> emit,
  ) async {
    try {
      await Future.delayed(
        Duration(seconds: 4),
        () {},
      ).whenComplete(() => emit(state.copyWith(stateEnum: StateEnum.loading)));

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await FirebaseAppCheck.instance.activate(
        androidProvider: AndroidProvider.debug,
        // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
        // your preferred provider. Choose from:
        // 1. Debug provider
        // 2. Device Check provider
        // 3. App Attest provider
        // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
        appleProvider: AppleProvider.appAttest,
      );
      await Future.delayed(
        Duration(seconds: 10),
        () {},
      ).whenComplete(() => emit(state.copyWith(stateEnum: StateEnum.failed)));

      //emit(state.copyWith(stateEnum: StateEnum.success));
    } catch (e) {
      emit(state.copyWith(stateEnum: StateEnum.failed));
    }
  }
}
