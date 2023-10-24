import 'package:aaya/functions/get_fmc_token.dart';
import 'package:aaya/main.dart';
import 'package:aaya/repository/api_services/common_service.dart';
import 'package:aaya/repository/routes/api_routes.dart';
import 'package:aaya/services/token_services.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';

class UserService {
  static Future<bool> updateUser(
      {required String name,
      String? profilePath,
      required Position position}) async {
    Dio dio = dioInstance!;
    String path = ApiRoutes.baseUrl + ApiRoutes.updateUser;
    Map<String, String> header = await TokenServices.getHeader();
    if (profilePath != null) {
      Logger().e("going to upload");
      profilePath = await CommonService.uploadFile(filePath: profilePath);
    }
    String? fmcToken = await getFCMToken();
    Logger().d(profilePath);
    Map<String, dynamic> data = {
      "name": name,
      "longitude": position.longitude,
      "latitude": position.latitude,
      "profile_url": profilePath,
      "location_name": "Home",
      "fmc_token": fmcToken
    };
    try {
      Response res =
          await dio.post(path, options: Options(headers: header), data: data);
      return res.statusCode == 200;
    } on Exception {
      return false;
    }
  }
}
