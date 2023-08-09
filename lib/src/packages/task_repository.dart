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
      final CollectionReference posts = FirebaseFirestore.instance.collection("posts");
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
    required DateTime currentTime,
  }) async {
    final List<TaskModel> outputTaskModelList = [];
    final nowTime = DateTime.now();
    //final inputTime = DateTime.utc(nowTime.year, nowTime.month, nowTime.day);
    //final endDate =
    //    DateTime.utc(nowTime.year, nowTime.month, nowTime.day, 24, 00, 00);
    String userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      final resultQuery = await postCollection
          .where("userId", isEqualTo: userId)
          .where("startDate", isLessThanOrEqualTo: nowTime)
          .where("taskType", isEqualTo: taskTypeEnum.name)
          .get();
      for (var docSnapshot in resultQuery.docs) {
        //print("Data: ${docSnapshot.data()}");
        final TaskModel data = TaskModel.fromJson(docSnapshot.data());
        //print("Data: ${docSnapshot.id}");
        if (data.endDate!.isAfter(currentTime)) {
          outputTaskModelList.add(data);
        }
      }
      //print('Data: $outputTaskModelList');

      onSuccess(outputTaskModelList);
    } catch (e) {
      //print("Error: $e");
      onError(e.toString());
    }
    //print("End==");
  }

  Future<void> deleteTaskApi(String taskId) async {
    final credential = await postCollection.where("taskId", isEqualTo: taskId).get();
    if (credential.docs.isNotEmpty) {
      postCollection.doc(credential.docs.first.id).delete();
    }
  }

  Future<void> editTaskApi(
    String taskId, {
    required Function(String message) onSuccess,
    required Function(String error) onError,
    required Map<String, dynamic> data,
  }) async {
    try {
      final credential = await postCollection.where("taskId", isEqualTo: taskId).get();
      if (credential.docs.isNotEmpty) {
        await postCollection.doc(credential.docs.first.id).update(data);
      }
      onSuccess("Updated successfully");
    } catch (e) {
      onError(e.toString());
    }
  }

  Stream<int> totalCompletedTask(String userId) async* {
    final data = await postCollection.where("userId", isEqualTo: userId).count().get();
    yield data.count;
  }

  Future<TaskModel?> handleGetTaskDetail(String taskId) async {
    try {
      final data = await postCollection.where("taskId", isEqualTo: taskId).get();
      if (data.docs.isNotEmpty) {
        final TaskModel taskModel = TaskModel.fromJson(data.docs.first.data());
        return taskModel;
      }
    } catch (e) {}
    return null;
  }
}
