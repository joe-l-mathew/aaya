import 'package:aaya/repository/routes/api_routes.dart';
import 'package:dio/dio.dart';

class AuthServices {
  static Future<bool> sentOtp({required String phoneNumber}) async {
    
    Map<String, dynamic> data = {"phone_number": phoneNumber};
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.sentOtp;
    Response res = await dio.post(path, data: data);
    print(res);
    return res.statusCode == 200;
  }
}
