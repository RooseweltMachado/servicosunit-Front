import 'package:flutter/cupertino.dart';

class LoginController {
  TextEditingController? txtMatricula;
  TextEditingController? txtSenha;

  LoginController() {
    txtMatricula = TextEditingController();
    txtSenha = TextEditingController();
  }
}
