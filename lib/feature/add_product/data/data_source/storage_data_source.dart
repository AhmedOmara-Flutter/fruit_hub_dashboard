import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

abstract class StorageDataSource {
  Future<String> uploadImage(File imageFile,String path);

}


class SupabaseStorage implements StorageDataSource {
  final SupabaseClient _supabase = Supabase.instance.client;
  @override
  Future<String> uploadImage(File imageFile, String path) async {
    final file = File(imageFile.path);

    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';

    await _supabase.storage.from(path).upload(fileName, file);

    final publicUrl = _supabase.storage.from(path).getPublicUrl(fileName);

    return publicUrl;
  }
}