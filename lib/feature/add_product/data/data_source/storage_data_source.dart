import 'dart:io';

abstract class StorageDataSource {
  Future<String> uploadImage(File imageFile,String path);

}


class FirebaseStorage implements StorageDataSource {
  @override
  Future<String> uploadImage(File imageFile, String path) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}