import 'package:flutter/material.dart';
import 'package:hi_task/src/res/colors/app_colors.dart';

class LoadingIconBase extends StatelessWidget {
  const LoadingIconBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors().brandColor_02,
        strokeWidth: 4,
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
