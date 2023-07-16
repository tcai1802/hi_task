import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';

class TotalAnalysisWidget extends StatelessWidget {
  const TotalAnalysisWidget({
    super.key,
    this.title = "",
    this.totalNumber = 0,
  });
  final String title;
  final int totalNumber;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
              color: context.resources.color.bgColor,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(0, 1),
                  spreadRadius: 2,
                  blurRadius: 4,
                )
              ]),
          child: Column(
            children: [
              Text(
                title,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 11.h),
              Text(
                totalNumber.toString(),
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(height: 11.h),
            ],
          ),
        ),
      ),
    );
  }
}
