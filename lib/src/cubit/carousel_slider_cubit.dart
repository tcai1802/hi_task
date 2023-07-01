import 'package:bloc/bloc.dart';

class CarouselSliderCubit extends Cubit<int> {
  CarouselSliderCubit() : super(0);

  void handleMoveSlide(int index) => emit(index);
}
