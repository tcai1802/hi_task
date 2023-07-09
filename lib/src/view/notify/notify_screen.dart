import 'package:flutter/material.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/view/notify/components/exports.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarWithBodyBase(
      title: "Notification",
      enableBorder: true,
      bodyWidget: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return NotifyItem();
        },
      ),
    );
  }
}
