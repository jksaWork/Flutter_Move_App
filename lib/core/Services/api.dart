import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as GET;
import 'package:get_storage/get_storage.dart';

class Api {
  static final dio = Dio(BaseOptions(
    baseUrl: 'https://movies.app.bassilali.com',
    receiveDataWhenStatusError: true,
  ));

  static void initilzieIntercepters() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) async {
        GetStorage box = GetStorage();
        var token = await GetStorage().read('login_token');
        print(token);
        Map<String, String> headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token}',
        };
        request.headers.addAll(headers);
        return handler.next(request);
      },
      onResponse: (response, handler) {
        // print(response);
        if (response.data['status'] == false) throw response.data['message'];
        return handler.next(response);
      },
      onError: (error, handler) {
        if (GET.Get.isDialogOpen == true) {
          GET.Get.back();
        }

        GET.Get.snackbar(
          'error'.tr,
          '${error.message}',
          snackPosition: GET.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );

        return handler.next(error); //continue
      },
    ));
  }

  static getGenres() async {
    return dio.get('/api/genres');
  }

  static getMovies(String type) async {
    return dio.get('/api/movies?type=$type');
  }
}
