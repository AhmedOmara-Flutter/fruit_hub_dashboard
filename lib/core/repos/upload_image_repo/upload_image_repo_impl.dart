import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/upload_image_repo/upload_image_repo.dart';
import 'package:fruit_hub_dashboard/feature/add_product/data/data_source/storage_data_source.dart';

class UploadImageRepoImpl implements UploadImageRepo {
  SupabaseStorage storage = SupabaseStorage();

  @override
  Future<Either<Failure, String>> uploadImage(File imageFile) async {
    try {
      var imageUploaded = await storage.uploadImage(imageFile, 'images');
      return Right(imageUploaded);
    } catch (e) {

      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}