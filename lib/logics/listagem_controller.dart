import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:servicosunit/models/aluno_model.dart';
import 'package:servicosunit/models/solicitacao_model.dart';
import 'package:servicosunit/repositories/aluno_repository.dart';
import 'package:servicosunit/repositories/solicitacao_repository.dart';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
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
  validarSolicitacao(String id) async {
    await solicitacaoRepository.validarArquivo(id);
    await getSolicita();
  }

  @action
  deleteSolicacao(String id) async {
    await solicitacaoRepository.deleteArquivo(id);
    await getSolicita();
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

  Future<String> downloadFile(String url, String fileName) async {
    HttpClient httpClient = new HttpClient();
    File file;
    String filePath = '';
    String myUrl = '';

    try {
      myUrl = url + '/' + fileName;
      var request = await httpClient.getUrl(Uri.parse(myUrl));
      var response = await request.close();
      if (response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        Directory appDocDir = await getApplicationDocumentsDirectory();
        String dir = appDocDir.path;
        filePath = '$dir/$fileName';
        file = File(filePath);
        file = await file.writeAsBytes(bytes);
        file;
      } else
        filePath = 'Erro no codigo: ' + response.statusCode.toString();
    } catch (ex) {
      filePath = 'Can not fetch url';
    }

    return filePath;
  }
}
