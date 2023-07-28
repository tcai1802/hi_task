import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hi_task/src/models/model_exports.dart';

class TaskRepository {
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
}
