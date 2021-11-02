import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'solicitacao_controller.g.dart';

class SolicitacaoController = _SolicitacaoControllerBase
    with _$SolicitacaoController;

abstract class _SolicitacaoControllerBase with Store {
  TextEditingController? txtMatricula;
  TextEditingController? txtSenha;
  TextEditingController? txtCurso;
  TextEditingController? txtTurno;

  SolicitacaoControllerBase() {
    txtMatricula = TextEditingController();
    txtSenha = TextEditingController();
    txtCurso = TextEditingController();
    txtTurno = TextEditingController();
  }

  @observable
  File? arquivo;

  @action
  Future pegarArquivo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      arquivo = File(result.files.single.path!);
    } else
      return;
  }
}
