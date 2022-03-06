import 'dart:convert';

import 'package:get/get.dart';

import 'package:simbora_app/app/data/model/login_model.dart';
import 'package:simbora_app/app/data/model/login_sigaa_model.dart';
import 'package:simbora_app/app/data/model/register_model.dart';
import 'package:simbora_app/app/data/model/user_model.dart';
import 'package:simbora_app/app/data/provider/auth_provider.dart';
import 'package:simbora_app/app/data/provider/headers.dart';
import 'package:simbora_app/app/database/store.dart';
import 'package:simbora_app/app/database/store_keys.dart';
import 'package:simbora_app/app/database/auth_token.dart';
import 'package:simbora_app/app/global/global_user_info_controller.dart';
import 'package:simbora_app/app/global/widgets/dialogs/ask_dialog.dart';
import 'package:simbora_app/app/global/widgets/dialogs/response_dialogs.dart';
import 'package:simbora_app/app/routes/app_pages.dart';
import 'package:simbora_app/app/utils/errors_message.dart';

class AuthRepository {
  final AuthConnect api = AuthConnect();
  //final AuthApiClient apo = AuthApiClient();

  ///Faz o login do usuário
  authLogin(AuthLogin loginModel) async {
    final response = await api.login(loginModel);

    //Sucesso
    if (response.isOk) {
      //Atualiza o usuário
      Map<String, dynamic> reponseData =
          json.decode(utf8.decode(response.bodyString!.runes.toList()));
      Map<String, dynamic> userData = reponseData['user'];

      //Adiquire o token de acesso
      String token = reponseData['key'] as String;
      AuthToken.token = token;
      Headers.headers = {'Authorization': 'Token ' + AuthToken.token!};

      //Salva as informações da sessão na instância global
      final globalController = Get.find<GlobalUserInfoController>();
      globalController.setSession(User.fromJson(userData));

      //Salva os dados da sessão na base local
      Store.saveString(StoreKeys.TOKEN, token);
      Store.saveMap(StoreKeys.SESSION, globalController.getSession!.toJson());

      return userData;
    } else {
      /* Map<String, dynamic> reponseData =
          json.decode(utf8.decode(response.bodyString!.runes.toList())); */

      final String erroMsg = getErroMessage(response.body);

      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }

  authLoginSigaa(AuthLoginSigaa loginModel) async {
    final response = await api.loginSigaa(loginModel);

    //Sucesso
    if (response.isOk) {
      //Atualiza o usuário
      Map<String, dynamic> reponseData =
          json.decode(utf8.decode(response.bodyString!.runes.toList()));
      Map<String, dynamic> userData = reponseData['user'];

      //Adiquire o token de acesso

      String token = reponseData['key'] as String;

      AuthToken.token = token;
      Headers.headers = {'Authorization': 'Token ' + AuthToken.token!};

      //Salva as informações da sessão na instância global
      final globalController = Get.find<GlobalUserInfoController>();
      globalController.setSession(User.fromJson(userData));

      //Salva os dados da sessão na base local
      Store.saveString(StoreKeys.TOKEN, token);
      Store.saveMap(StoreKeys.SESSION, globalController.getSession!.toJson());

      return userData;
    } else {
      /* Map<String, dynamic> reponseData =
          json.decode(utf8.decode(response.bodyString!.runes.toList())); */

      final String erroMsg = getErroMessage(response.body);

      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }

  ///Deslogar da sessão
  Future<void> authLogout() async {
    Get.dialog(AskDialog(
      title: 'Logout',
      content: 'Deseja fazer logout do sistema?',
    )).then((value) async {
      if (value != null && value) {
        //Limpa os dados da sessão
        Store.clearStore();
        final response = await api.logout();
        Get.log(response.body.toString());

        //Vai para a tela de login e remove as rotas anteriores
        Get.offAllNamed(Routes.LOGIN);
      }
    });
  }

  ///Cria um novo usuário
  Future<void> authCreateUser(AuthRegister user) async {
    //isLoading = true;
    final Response response = await api.createAccount(user);
    //isLoading = false;

    //Sucesso
    if (response.isOk) {
      //Mostra o dialog de erro
      await Get.dialog(SuccessDialog(
          'Conta criada com sucesso!\n Um email de verificação foi enviado para ${user.email}'));
      Get.offAllNamed(Routes.LOGIN);
    } else {
      /* Map<String, dynamic> reponseData =
          json.decode(utf8.decode(response.bodyString!.runes.toList())); */
      final String erroMsg = getErroMessage(response.body);

      //Mostra o dialog de erro
      Get.dialog(FailureDialog(erroMsg));
    }
  }
}
