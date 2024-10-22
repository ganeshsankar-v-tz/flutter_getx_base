import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static showSuccessToast({required String message}) {


    /*return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0);*/
  }

  static showErrorToast({required String message}) {
    /*return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0);*/
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
}
