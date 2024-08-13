import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:ecomy/domain/downlads/core/failure/main_failure.dart';
import 'package:ecomy/domain/downlads/downloadEndPoints.dart';
import 'package:ecomy/domain/downlads/i_downloads_repo.dart';
import 'package:ecomy/domain/downlads/models/downloads.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  final token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZmExNTIxYzhhYzY3NTQ3YjU4OThlMzg1NjE2OWNjYSIsIm5iZiI6MTcyMjU5MTI1NS41NTA1ODksInN1YiI6IjYwYjFhNzAyNTdkMzc4MDA0MjgxZmZkNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VAE_qN5QODCN4oTBfxFkxajqQku__yWGhcf1NR097bE';
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      print(DownloadEndPoints.kEndPoint);

      final dio.Response response = await dio.Dio(
        dio.BaseOptions(
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      ).get(DownloadEndPoints.kEndPoint);

      // final response = await http.get(Uri.parse(DownloadEndPoints.kEndPoint));
      // // print(response);

      // print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Downloads> newList = [];

        (response.data as List).map((e) {
          newList.add(Downloads.fromJson(e));

          // Downloads.fromJson(e);
        }).toList();

        return Right(newList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print('shinto--$e');
      return const Left(
        MainFailure.clienFailure(),
      );
    }
  }
}
