import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/user_model.dart';

class GlobalUserInfoController extends GetxController {
  //A guarda os dados da sessão do usuário
  User? _session;
  User? get getSession => this._session;

  void setSession(User session) {
    this._session = session;
    update();
  }
}
