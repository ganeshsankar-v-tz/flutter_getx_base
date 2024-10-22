import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/constant.dart';

class DioClient extends DioMixin implements Dio {

  static dynamic dioConfig() {
    final box = GetStorage();
    final accessToken = box.read('access_token') ?? '';
    final headers = {'Authorization': accessToken};
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: Constants.BASE_URL,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        followRedirects: true,
        headers: headers,
        contentType: 'application/json',
      ),
    );

    // Don't trust any certificate just because their root cert is trusted
    /*dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient(
          context: SecurityContext(withTrustedRoots: false),
        );
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );*/

    return dio;
  }

  static dynamic dioFileConfig() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: Constants.BASE_URL,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        followRedirects: true,
        headers: null,
        contentType: 'multipart/form-data',
      ),
    );

    // Don't trust any certificate just because their root cert is trusted
    /*dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient(
          context: SecurityContext(withTrustedRoots: false),
        );
        // You can test the intermediate / root cert here. We just ignore it.
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );*/

    return dio;
  }

  static dynamic dioClose() {
    final Dio dio = Dio();
    dio.close(force: true);
  }

  static dynamic errorHandling(DioException e) {
    /// When the server response, but with a incorrect status, such as 404, 503
    if (e.type == DioExceptionType.badResponse) {
      return DioExceptionType.badResponse;
    }
    if (e.type == DioExceptionType.connectionTimeout) {
      return 'Please check your internet connection';
    }
    if (e.type == DioExceptionType.receiveTimeout) {
      return 'Unable to connect to the server';
    }
    if (e.type == DioExceptionType.badCertificate) {
      return 'Unauthorized access';
    }
    if (e.type == DioExceptionType.unknown) {
      return 'Something went wrong';
    }

    /// When the request is cancelled, dio will throw a error with this type.
    if (e.type == DioExceptionType.cancel) {
      return 'Something went wrong';
    }
  }

  static List<dynamic>? listOfMultiPart(List<File> file) {
    final List<dynamic> multiPartValues = [];
    for (File element in file) {
      multiPartValues.add(MultipartFile.fromFile(
        element.path,
        // filename: element.path.split('/').last,
      ));
    }
    return multiPartValues;
  }

  @override
  Future<Response> download(String urlPath, savePath,
      {ProgressCallback? onReceiveProgress,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      bool deleteOnError = true,
      String lengthHeader = Headers.contentLengthHeader,
      Object? data,
      Options? options}) {
    // TODO: implement download
    throw UnimplementedError();
  }
}
