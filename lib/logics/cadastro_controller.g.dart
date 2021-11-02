// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroController on _CadastroControllerBase, Store {
  final _$imagemAtom = Atom(name: '_CadastroControllerBase.imagem');

  @override
  File? get imagem {
    _$imagemAtom.reportRead();
    return super.imagem;
  }

  @override
  set imagem(File? value) {
    _$imagemAtom.reportWrite(value, super.imagem, () {
      super.imagem = value;
    });
  }

  final _$imagemTemporariaAtom =
      Atom(name: '_CadastroControllerBase.imagemTemporaria');

  @override
  PickedFile? get imagemTemporaria {
    _$imagemTemporariaAtom.reportRead();
    return super.imagemTemporaria;
  }

  @override
  set imagemTemporaria(PickedFile? value) {
    _$imagemTemporariaAtom.reportWrite(value, super.imagemTemporaria, () {
      super.imagemTemporaria = value;
    });
  }

  final _$pegarImagemAsyncAction =
      AsyncAction('_CadastroControllerBase.pegarImagem');

  @override
  Future<dynamic> pegarImagem() {
    return _$pegarImagemAsyncAction.run(() => super.pegarImagem());
  }

  final _$tirarFotoAsyncAction =
      AsyncAction('_CadastroControllerBase.tirarFoto');

  @override
  Future<dynamic> tirarFoto() {
    return _$tirarFotoAsyncAction.run(() => super.tirarFoto());
  }

  @override
  String toString() {
    return '''
imagem: ${imagem},
imagemTemporaria: ${imagemTemporaria}
    ''';
  }
}
