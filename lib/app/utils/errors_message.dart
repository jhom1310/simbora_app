const String TIMEOUT_MSG = 'Timeout: Tempo limite atingido';
const String ERROR_MSG = 'Ocorreu um erro desconhecido';

String getErroMessage(Map<String, dynamic> reponseData) {
  String msg = reponseData.values.toString();
  msg = msg
      .replaceAll('[', '')
      .replaceAll(']', '')
      .replaceAll('(', '')
      .replaceAll(')', '');
  List erroList = msg.split(',');
  msg = '';
  if (erroList.length > 1) {
    for (int i = 0; i < erroList.length; i++) {
      msg += '${i + 1} - ${erroList[i]}\n';
    }
  } else {
    msg = erroList[0];
  }
  return msg;
}
