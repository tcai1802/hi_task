import 'package:hi_task/src/res/enum/app_enum.dart';

class EnumConvert {
  TaskTypeEnum? convertTaskTypeEnum(String value) {
    if (value == TaskTypeEnum.dailyTask.name) {
      return TaskTypeEnum.dailyTask;
    } else if (value == TaskTypeEnum.dailyTask.name) {
      return TaskTypeEnum.priorityTask;
    }
    return null;
  }
}
