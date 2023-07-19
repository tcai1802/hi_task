import 'package:hi_task/src/res/regex/regex.dart';

class AppRegex extends Regex {
  @override
  String get emailRegex => r"^\S+@\S+\.\S+$";

  @override
  String get passRegex =>
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$";
}
