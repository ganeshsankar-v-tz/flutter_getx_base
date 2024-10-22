import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dio_client.dart';

enum RequestType { get, post, put, delete, upload, download, singleFileUpload }

class HttpRepository {
  static void onReceiveProgress(int received, int total) {
    if (total != -1) {
      /*setState(() {
        _progress = (received / total * 100).toStringAsFixed(0) + "%";
      });*/
    }
  }

  static Future<ResponseData> apiRequest(RequestType requestType, String url,
      {dynamic request,
      File? file,
      FormData? formData,
      String? savePath}) async {
    ResponseData? responseData;
    debugPrint('Request-> url: $url request: $request');
    try {
      Response<dynamic>? response;
      switch (requestType) {
        case RequestType.get:
          response = await DioClient.dioConfig().get(url);
          break;
        case RequestType.post:
          response = await DioClient.dioConfig().post(url, data: request);
          break;
        case RequestType.delete:
          response = await DioClient.dioConfig().delete(url);
          break;
        case RequestType.upload:
          response = await DioClient.dioFileConfig().post(url, data: formData);
          break;
        case RequestType.singleFileUpload:
          final FormData data = FormData.fromMap(
              {'file': await MultipartFile.fromFile(file!.path)});
          response = await DioClient.dioFileConfig().post(url, data: data);
          break;
        case RequestType.download:
          response = await DioClient.dioConfig()
              .download(url, savePath, onReceiveProgress: onReceiveProgress);
          break;
        case RequestType.put:
          response = await DioClient.dioConfig().put(url, data: request);
          break;
        default:
          response = await DioClient.dioConfig().post(url, data: request);
      }
      responseData = ResponseData(
        success: true,
        data: response?.data,
        statusCode: response?.statusCode,
        message: response?.statusMessage,
      );
    } on DioException catch (e) {
      debugPrint(e.message);
      //AppUtils.showErrorToast(message: DioClient.errorHandling(e).toString());
      responseData = ResponseData(
          success: false,
          data: e.response,
          statusCode: e.response?.statusCode,
          message: DioClient.errorHandling(e).toString());
      DioClient.dioClose();
    }
    return responseData;
  }
}

class ResponseData {
  dynamic data;
  bool success;
  int? statusCode;
  String? message;

  ResponseData({
    required this.data,
    required this.success,
    this.statusCode,
    this.message,
  });
}
