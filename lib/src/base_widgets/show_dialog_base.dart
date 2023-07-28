import 'package:flutter/material.dart';

showDialogBase(
  BuildContext context,
  Widget body, {
  bool enableWillPop = true,
}) {
  return showDialog(
    context: context,
    builder: (context) => WillPopScope(
      onWillPop: () async => enableWillPop,
      child: AlertDialog(
        scrollable: true,
        // <-- SEE HERE
        title: const SizedBox(),
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        actions: [body],
      ),
    ),
  );
}
