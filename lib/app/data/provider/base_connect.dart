import 'package:get/get.dart';

class BaseConnect extends GetConnect {
  @override
  void onInit() {
    //URL base
    httpClient.baseUrl = 'http://192.168.56.1:8000';

    /*  httpClient.addResponseModifier((request, response) {
      if (Get.isLogEnable) {
        print('${request.method}');
        print('${request.url}');
      }
    }); */

    httpClient.defaultContentType = 'application/json; charset=utf-8';

    /* //Decodificador padrão para todas as requisições
      httpClient.defaultDecoder = (response) {
      List<int> bytes = response.toString().codeUnits;
      return utf8.decode(bytes);
    };  */

    //Tempo de duração das requisições
    httpClient.timeout = Duration(seconds: 15);

    //Em caso de falha, número de tentativas
    httpClient.maxAuthRetries = 2;
  }
}
