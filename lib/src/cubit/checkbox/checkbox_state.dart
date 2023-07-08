import 'package:equatable/equatable.dart';

class CheckBoxState extends Equatable {
  final bool isCheckBox;
  const CheckBoxState(this.isCheckBox);

  @override
  List<Object?> get props => [isCheckBox];
}
