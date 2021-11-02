import 'package:flutter/cupertino.dart';
import 'package:servicosunit/models/solicitacao_model.dart';
import 'package:servicosunit/repositories/solicitacao_repository.dart';
import 'package:mobx/mobx.dart';

class ListagemController {
  TextEditingController? txtPesquisa;
  late SolicitacaoRepository repository;

  @observable
  List<SolicitacaoModel>? listSolicitacao;

  ListagemController() {
    repository = SolicitacaoRepository();
    txtPesquisa = TextEditingController();
  }

  @action
  getSolicitacao() {
    var response = repository.findAll();
  }
}
