import 'package:flutter/material.dart';
import 'package:hi_task/src/base_widgets/export.dart';

showCalendarDialog(BuildContext context, Widget body) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      // <-- SEE HERE
      title: const SizedBox(),
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      actions: [body],
    ),
  );
}
