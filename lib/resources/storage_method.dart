import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImgToStorage(
      String childName, Uint8List file, bool ispost) async {
    Reference ref =
        await _storage.ref().child(childName).child(_auth.currentUser!.uid);

    UploadTask upload = ref.putData(file);

    TaskSnapshot snap = await upload;
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }
}
