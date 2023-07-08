import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_task/src/cubit/checkbox/checkbox_state.dart';

class CheckBoxCubit extends Cubit<CheckBoxState> {
  CheckBoxCubit() : super(const CheckBoxState(false));
  void handleCheckOrNot(bool isCheck, Function callBack) {
    emit(CheckBoxState(isCheck));
    callBack();
  }
}
