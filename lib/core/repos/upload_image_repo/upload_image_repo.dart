import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';

abstract class UploadImageRepo {
  Future<Either<Failure, String>> uploadImage(File imageFile);
}

