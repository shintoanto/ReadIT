import 'package:dartz/dartz.dart';
import 'package:ecomy/domain/downlads/core/failure/main_failure.dart';
import 'package:ecomy/domain/gBookImages/models/GBookModels.dart';

abstract class IGBookImageRepo{
  Future<Either<MainFailure, List<GBookModels>>> getDownloadsGBooksImage();
}