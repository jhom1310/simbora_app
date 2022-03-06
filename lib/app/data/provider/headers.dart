import 'package:simbora_app/app/database/auth_token.dart';

class Headers {
  static var headers = {'Authorization': 'Token ' + AuthToken.token!};
}
