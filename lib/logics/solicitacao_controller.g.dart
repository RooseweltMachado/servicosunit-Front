// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SolicitacaoController on _SolicitacaoControllerBase, Store {
  final _$arquivoAtom = Atom(name: '_SolicitacaoControllerBase.arquivo');

  @override
  File? get arquivo {
    _$arquivoAtom.reportRead();
    return super.arquivo;
  }

  @override
  set arquivo(File? value) {
    _$arquivoAtom.reportWrite(value, super.arquivo, () {
      super.arquivo = value;
    });
  }

  final _$pegarArquivoAsyncAction =
      AsyncAction('_SolicitacaoControllerBase.pegarArquivo');

  @override
  Future<dynamic> pegarArquivo() {
    return _$pegarArquivoAsyncAction.run(() => super.pegarArquivo());
  }

  @override
  String toString() {
    return '''
arquivo: ${arquivo}
    ''';
  }
}
