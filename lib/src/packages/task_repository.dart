import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hi_task/src/models/model_exports.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

class TaskRepository {
  final postCollection = FirebaseFirestore.instance.collection("posts");
  Future<void> createTaskApi(
    TaskModel taskModel, {
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final CollectionReference posts =
          FirebaseFirestore.instance.collection("posts");
      final String taskId = posts.doc().id;
      await posts.add(CreateTaskRequest().toMap(taskModel, taskId));
      onSuccess();
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<void> getTaskInADay({
    required TaskTypeEnum taskTypeEnum,
    required Function onSuccess,
    required Function onError,
  }) async {
    final List<TaskModel> outputTaskModelList = [];
    final nowTime = DateTime.now();
    final inputTime = DateTime.utc(nowTime.year, nowTime.month, nowTime.day);
    final endDate =
        DateTime.utc(nowTime.year, nowTime.month, nowTime.day, 24, 00, 00);
    String userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      final resultQuery = await postCollection
          .where("userId", isEqualTo: userId)
          .where("startDate", isGreaterThanOrEqualTo: inputTime)
          .where("startDate", isLessThanOrEqualTo: endDate)
          .where("taskType", isEqualTo: taskTypeEnum.name)
          .get();

      for (var docSnapshot in resultQuery.docs) {
        final TaskModel data = TaskModel.fromJson(docSnapshot.data());
        outputTaskModelList.add(data);
      }
      print('Data: $outputTaskModelList');

      onSuccess(outputTaskModelList);
    } catch (e) {
      onError(e.toString());
    }
    print("End==");
  }
}
