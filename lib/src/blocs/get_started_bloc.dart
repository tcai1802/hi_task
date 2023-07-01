import 'package:hi_task/src/res/drawable/app_drawable.dart';

class GetStartedBloc {
  final List<Map<String, String>> _onboardingList = [
    {
      "imageUrl": AppDrawable().imgGetStarted1,
      "title": "Easy Time Management",
      "description":
          "With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first",
    },
    {
      "imageUrl": AppDrawable().imgGetStarted2,
      "title": "Increase Work Effectiveness",
      "description":
          "Time management and the determination of more important tasks will give your job statistics better and always improve",
    },
    {
      "imageUrl": AppDrawable().imgGetStarted3,
      "title": "Reminder Notification",
      "description":
          "The advantage of this application is that it also provides reminders for you so you don't forget to keep doing your assignments well and according to the time you have set",
    }
  ];
  List<Map<String, String>> get onboardingList => _onboardingList;
}
