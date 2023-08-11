import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hi_task/firebase_options.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/res/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      emit(state.copyWith(splashState: StateEnum.loading));

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      //FirebaseAuth.instance;
      await FirebaseAppCheck.instance.activate(
        androidProvider: AndroidProvider.debug,
        appleProvider: AppleProvider.appAttest,
      );

      // Check is the first open app
      await Future.delayed(const Duration(seconds: 2)); // slow app
      if (FirebaseAuth.instance.currentUser != null) {
        emit(state.copyWith(
          splashState: StateEnum.success,
          firstOpenAppState: false,
          isLogged: true,
        ));
      }
      //FirebaseAuth.instance.signOut();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool? firstOpenApp = prefs.getBool("firstOpenApp");
      if (firstOpenApp == null || !firstOpenApp) {
        await prefs.setBool("firstOpenApp", true);
        emit(state.copyWith(
          splashState: StateEnum.success,
          firstOpenAppState: true,
        ));
      } else {
        emit(state.copyWith(splashState: StateEnum.success, firstOpenAppState: true));
      }

      FirebaseAuth.instance.authStateChanges().listen((event) {
        if (event == null) {
          AppRoutes().dispose();
        }
      });
    } catch (e) {
      emit(state.copyWith(splashState: StateEnum.failed));
    }
  }
}
