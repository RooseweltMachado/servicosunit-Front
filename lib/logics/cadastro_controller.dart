import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'cadastro_controller.g.dart';

class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  TextEditingController? txtMatricula;
  TextEditingController? txtSenha;
  TextEditingController? txtCurso;
  TextEditingController? txtTurno;

  _CadastroControllerBase() {
    txtMatricula = TextEditingController();
    txtSenha = TextEditingController();
    txtCurso = TextEditingController();
    txtTurno = TextEditingController();
  }

  @observable
  File? imagem;

  @observable
  PickedFile? imagemTemporaria;

  @action
  Future pegarImagem() async {
    imagemTemporaria =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (imagemTemporaria == null) return;

    imagem = File(imagemTemporaria!.path);
  }

  @action
  Future tirarFoto() async {
    imagemTemporaria = await ImagePicker().getImage(source: ImageSource.camera);
    imagem = File(imagemTemporaria!.path);
  }

  void seletor(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.5),
                            radius: 32,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  pegarImagem();
                                },
                                icon: Icon(
                                  Icons.photo,
                                  color: Colors.white,
                                ))),
                        Text("Galeria")
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          radius: 32,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                                tirarFoto();
                              },
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              )),
                        ),
                        Text("Tirar foto")
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
