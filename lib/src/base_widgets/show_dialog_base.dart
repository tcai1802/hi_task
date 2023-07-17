import 'package:flutter/material.dart';

showDialogBase(BuildContext context, Widget body) {
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
