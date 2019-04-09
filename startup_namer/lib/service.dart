// import 'package:flutter/services.dart';

import 'package:dio/dio.dart';

class Services {
  static Future<dynamic> getUserInfo() async {
    Dio dio = new Dio();
    // Response<Map> response =
    //     await dio.get("http://yapi.nasawz.com/mock/18/api/v1/users/current");
    return dio.get("http://yapi.nasawz.com/mock/18/api/v1/users/current");
  }

  // Future<dynamic> post({String action, Map params}) async {
  //   var dio = Service.createDio();
  //   Response<Map> response = await dio.post(action, data: params);
  //   var data = response.data['data'];
  //   return data;
  // }
}
