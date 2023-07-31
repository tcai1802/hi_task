import 'package:hi_task/src/res/enum/app_enum.dart';

class EnumConvert {
  TaskTypeEnum? convertTaskTypeEnum(String value) {
    print("Data: ${value}");
    if (value == TaskTypeEnum.dailyTask.name) {
      print("OKe:====");
      return TaskTypeEnum.dailyTask;
    } else if (value == TaskTypeEnum.priorityTask.name) {
      return TaskTypeEnum.priorityTask;
    }
    return TaskTypeEnum.dailyTask;
  }
}
