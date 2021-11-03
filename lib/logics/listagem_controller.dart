import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:servicosunit/models/aluno_model.dart';
import 'package:servicosunit/models/solicitacao_model.dart';
import 'package:servicosunit/repositories/aluno_repository.dart';
import 'package:servicosunit/repositories/solicitacao_repository.dart';
import 'package:mobx/mobx.dart';
part 'listagem_controller.g.dart';

class ListagemController = _ListagemControllerBase with _$ListagemController;

abstract class _ListagemControllerBase with Store {
  TextEditingController? txtPesquisa;
  late SolicitacaoRepository solicitacaoRepository;
  late AlunoRepository alunoRepository;

  @observable
  List<SolicitacaoModel> listSolicitacao = [];

  @observable
  List<AlunoModel> listAlunos = [];

  List<SolicitacaoModel> aux = [];
  _ListagemControllerBase() {
    solicitacaoRepository = SolicitacaoRepository();
    alunoRepository = AlunoRepository();
    txtPesquisa = TextEditingController();
  }
  getSolicita() async {
    var resposta = await solicitacaoRepository.getSolicitacao();
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

  getAlunos() async {
    var response = await alunoRepository.getAlunos();
    listAlunos = response;
  }

  getFile(String url) async {
    var response = await solicitacaoRepository.getArquivo(url);

    return response as String;
  }
}
