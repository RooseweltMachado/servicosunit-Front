import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:servicosunit/models/solicitacao_model.dart';
import 'package:servicosunit/repositories/solicitacao_repository.dart';
import 'package:mobx/mobx.dart';
part 'listagem_controller.g.dart';

class ListagemController = _ListagemControllerBase with _$ListagemController;

abstract class _ListagemControllerBase with Store {
  TextEditingController? txtPesquisa;
  late SolicitacaoRepository repository;

  @observable
  List<SolicitacaoModel> listSolicitacao = [];

  List<SolicitacaoModel> aux = [];
  _ListagemControllerBase() {
    repository = SolicitacaoRepository();
    txtPesquisa = TextEditingController();
  }
  getSolicita() async {
    var resposta = await repository.getSolicitacao();
    listSolicitacao = resposta;
    salvarListAux();
  }

  salvarListAux() {
    aux = listSolicitacao;
  }

  @action
  getPesquisa(String valor) {
    if (valor == "") {
      listSolicitacao = [];
      listSolicitacao = aux;
    } else {
      filtro(valor);
    }
  }

  filtro(String v) {
    listSolicitacao = listSolicitacao
        .where((element) => element.nomeCurso!.contains(v))
        .toList();
  }
}
