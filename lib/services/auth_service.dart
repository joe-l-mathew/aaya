import 'package:aaya/repository/api_services/auth_services.dart';
import 'package:aaya/services/token_services.dart';

Future<bool> isLoggedIn() async {
  String? token = await TokenServices.getToken();
  if (token == null) {
    return false;
  }
  return await AuthServices.getUser();
}
