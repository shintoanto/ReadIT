import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecomy/MyApi.dart';
import 'package:ecomy/domain/downlads/core/failure/main_failure.dart';
import 'package:ecomy/domain/downlads/downloadEndPoints.dart';
import 'package:ecomy/domain/downlads/i_downloads_repo.dart';
import 'package:ecomy/domain/downlads/models/downloads.dart';
import 'package:ecomy/infrastructure/api_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  final token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZmExNTIxYzhhYzY3NTQ3YjU4OThlMzg1NjE2OWNjYSIsIm5iZiI6MTcyMjU5MTI1NS41NTA1ODksInN1YiI6IjYwYjFhNzAyNTdkMzc4MDA0MjgxZmZkNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VAE_qN5QODCN4oTBfxFkxajqQku__yWGhcf1NR097bE';
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      print(DownloadEndPoints.kEndPoint);

      //  final Response response = await Dio(
      //   BaseOptions(headers: {
      //     'Authorization': 'Bearer $token',
      //     'accept': 'application/json',
      //   }),
      // ).get(DownloadEndPoints.kEndPoint);

      final response =
          await http.get(Uri.parse(DownloadEndPoints.kEndPoint), headers: {
        'Authorization': 'Bearer $token',
        'accept': 'application/json',
      }).then((e) {
        print(e.request.toString());
      });

      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadList = (response.body[1] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();

        // print(downloadList);
        return Right(downloadList);
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
