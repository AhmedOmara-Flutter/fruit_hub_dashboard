import 'dart:io';
import 'package:image/image.dart'as img;
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class StorageServices {
  Future<String> uploadImage(File imageFile,String path);
  Future<File> compressedImage(File imageFile);

}


class SupabaseStorage implements StorageServices {
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

  @override
  Future<File> compressedImage(File imageFile) async {
    final bytes = await imageFile.readAsBytes();

    img.Image? image = img.decodeImage(bytes);

    final compressed = img.copyResize(
      image!,
      width: 500,
    );

    final compressedFile = File(
      '${imageFile.path}_compressed.jpg',
    )
      ..writeAsBytesSync(
        img.encodeJpg(
          compressed,
          quality: 60,
        ),
      );

    return compressedFile;

  }
}