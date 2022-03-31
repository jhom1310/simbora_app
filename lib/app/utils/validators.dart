import 'package:get/get_utils/src/extensions/string_extensions.dart';

//Validar email
String? emailValidator(String? email) {
  if (email!.trim().isEmpty) return 'Informe seu email';
  if (!email.isEmail) return 'email inválido';

  return null;
}

//Validar nome
String? nameValidator(String? name) {
  if (name!.trim().isEmpty) return 'Informe seu nome';
  if (name.length < 3) return 'Escreva no minimo 3 letras';

  return null;
}

String? addressValidator(String? text) {
  if (text!.trim().isEmpty || text.isEmpty) return 'Informe os dados';

  return null;
}

//Validar gênero
String? genderValidator(String? gender) {
  if (gender == null) return 'Selecione seu gênero';

  return null;
}

String? institutionValidator(String? institution) {
  if (institution!.trim().isEmpty) return 'Informe seu nome';
  if (institution.length < 3) return 'Escreva no minimo 3 letras';

  return null;
}

//Validar senha 01
String? passwordValidator(String? password01) {
  if (password01!.trim().isEmpty) return 'Informe sua senha';
  if (password01.length < 8)
    return 'A senha precisa ter no mínimo 8 caracteres';

  return null;
}

//Validar senha 01
String? retryPasswordValidator(String? password02, String? password01) {
  if (password02!.trim().isEmpty) return 'Informe sua senha novamente';
  if (password02.length < 8)
    return 'A senha precisa ter no mínimo 8 caracteres';
  if (password01 != password02) return 'As senhas não são iguais';

  return null;
}
