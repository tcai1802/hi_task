import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class MediaRepository {
  final Reference images = FirebaseStorage.instance.ref();
  Future<String?> uploadFile(XFile file) async {
    final randomName = "avatar${DateTime.timestamp()}";
    final Reference avatarRef = images.child(randomName);
    //print("Full path: ${avatarRef.fullPath}");
    File uploadFile = File(file.path);
    try {
      final data = await avatarRef.child(randomName).putFile(uploadFile);
      String imageUrl = await data.ref.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      // ...
      //print("Error: $e");
      return null;
    }
  }
}
