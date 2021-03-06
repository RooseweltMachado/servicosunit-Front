// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listagem_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListagemController on _ListagemControllerBase, Store {
  final _$listSolicitacaoAtom =
      Atom(name: '_ListagemControllerBase.listSolicitacao');

  @override
  List<SolicitacaoModel> get listSolicitacao {
    _$listSolicitacaoAtom.reportRead();
    return super.listSolicitacao;
  }

  @override
  set listSolicitacao(List<SolicitacaoModel> value) {
    _$listSolicitacaoAtom.reportWrite(value, super.listSolicitacao, () {
      super.listSolicitacao = value;
    });
  }

  final _$listAlunosAtom = Atom(name: '_ListagemControllerBase.listAlunos');

  @override
  List<AlunoModel> get listAlunos {
    _$listAlunosAtom.reportRead();
    return super.listAlunos;
  }

  @override
  set listAlunos(List<AlunoModel> value) {
    _$listAlunosAtom.reportWrite(value, super.listAlunos, () {
      super.listAlunos = value;
    });
  }

  final _$_ListagemControllerBaseActionController =
      ActionController(name: '_ListagemControllerBase');

  @override
  dynamic validarSolicitacao(String id) {
    final _$actionInfo = _$_ListagemControllerBaseActionController.startAction(
        name: '_ListagemControllerBase.validarSolicitacao');
    try {
      return super.validarSolicitacao(id);
    } finally {
      _$_ListagemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteSolicacao(String id) {
    final _$actionInfo = _$_ListagemControllerBaseActionController.startAction(
        name: '_ListagemControllerBase.deleteSolicacao');
    try {
      return super.deleteSolicacao(id);
    } finally {
      _$_ListagemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPesquisa(String valor) {
    final _$actionInfo = _$_ListagemControllerBaseActionController.startAction(
        name: '_ListagemControllerBase.getPesquisa');
    try {
      return super.getPesquisa(valor);
    } finally {
      _$_ListagemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listSolicitacao: ${listSolicitacao},
listAlunos: ${listAlunos}
    ''';
  }
}
