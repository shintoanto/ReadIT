import 'package:dartz/dartz.dart';
import 'package:ecomy/domain/downlads/core/failure/main_failure.dart';
import 'package:ecomy/domain/downlads/models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
