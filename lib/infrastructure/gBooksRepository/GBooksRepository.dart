import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:ecomy/domain/downlads/core/failure/main_failure.dart';
import 'package:ecomy/domain/downlads/downloadEndPoints.dart';
import 'package:ecomy/domain/downlads/models/downloads.dart';
import 'package:ecomy/domain/gBookImages/models/GBookModels.dart';
import 'package:ecomy/domain/gBookImages/models/i_g_bookImage_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IGBookImageRepo)
class GBooksRepository implements IGBookImageRepo{

  @override
  Future<Either<MainFailure, GBookModels>> getDownloadsGBooksImage() async {

    try{


    //  print(DownloadEndPoints.bookEndPoint);

      final dio.Response response = await dio.Dio(
        dio.BaseOptions(
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      ).get(DownloadEndPoints.kEndPoint);

      print(response.data);

      if(response.statusCode == 200 || response.statusCode == 201){

        final List<GBookModels> bookList = [];
        print(Right(GBookModels.fromJson(response.data),));

        return Right(GBookModels.fromJson(response.data),);

      }else{
        print('failure');
        return const Left(MainFailure.serverFailure());

      }


    }catch(l){
      print('shinto --$l');
      return const Left(MainFailure.clienFailure(),);

    }

  }

}