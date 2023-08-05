import 'package:flutter/material.dart';
import 'package:hi_task/src/res/resources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);

}
