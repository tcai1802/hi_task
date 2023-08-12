import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hi_task/src/models/model_exports.dart';

class HelpRepository {
  final helpCollection = FirebaseFirestore.instance.collection("helps");

  Future<void> handleSubmitHelp(
    HelpModel data, {
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      await helpCollection.doc().set(const HelpModel().toMap(data));
      onSuccess();
    } catch (e) {
      onError();
    }
  }
}
