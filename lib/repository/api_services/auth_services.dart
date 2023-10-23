import 'package:aaya/controller/user_controller.dart';
import 'package:aaya/main.dart';
import 'package:aaya/models/api_models/user_data.dart';
import 'package:aaya/repository/routes/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class AuthServices {
  static Future<bool> sentOtp({required String phoneNumber}) async {
    Map<String, dynamic> data = {"phone_number": phoneNumber};
    Dio dio = dioInstance!;
    String path = ApiRoutes.baseUrl + ApiRoutes.sentOtp;
    Response res = await dio.post(path, data: data);
    return res.statusCode == 200;
  }

  static Future<bool> submitOtp(
      {required String phoneNumber, required String otp}) async {
    UserController userController = Get.find();
    Map<String, dynamic> data = {"phone_number": phoneNumber, "otp": otp};
    Dio dio = dioInstance!;
    String path = ApiRoutes.baseUrl + ApiRoutes.submitOtp;
    try {
      Response res = await dio.post(path, data: data);
      UserData userData = UserData.fromJson(res.data);
      userController.userData(userData);
      if (userData.name.isEmpty) {
        //get to add personal details
      } else {
        //get to home screen
      }
      return res.statusCode == 200;
    } on Exception {
      return false;
    }
  }
}
