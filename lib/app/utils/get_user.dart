import 'package:simbora_app/app/data/repository/user_repository.dart';

getUserUtil(id) async {
  UserRepository user_repository = UserRepository();
  var user;
  await user_repository.getUser(id).then((value) {
    user = value;
  }, onError: (err) {
    return null;
  });
  return user;
}
