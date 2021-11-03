import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:servicosunit/logics/solicitacao_controller.dart';
import 'package:servicosunit/view/pdf_user.dart';
import 'package:servicosunit/widgets/textfield_custom.dart';

class SolicitacaoPage extends StatefulWidget {
  const SolicitacaoPage({Key? key}) : super(key: key);

  @override
  _SolicitacaoPageState createState() => _SolicitacaoPageState();
}

class _SolicitacaoPageState extends State<SolicitacaoPage> {
  late SolicitacaoController _controller;
  @override
  void initState() {
    _controller = SolicitacaoController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 35, 78, 152),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.height * 0.3,
              child: Image.network(
                  "https://play-lh.googleusercontent.com/IpPntxBn6fUB_7SgH3UvCDgzlvcUKwQ9dReYPMJJfIxBuJiz7qCL5wdqHM4yvFLvBA"),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Column(
                    children: [
                      TextFieldCustom(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 35, 78, 152),
                        ),
                        controller: _controller.txtMatricula,
                        labelText: "Matricula",
                      ),
                      TextFieldCustom(
                        prefixIcon: Icon(
                          Icons.book_outlined,
                          color: Color.fromARGB(255, 35, 78, 152),
                        ),
                        controller: _controller.txtSenha,
                        labelText: "Instituição do Curso",
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              TextFieldCustom(
                                prefixIcon: Icon(
                                  Icons.school,
                                  color: Color.fromARGB(255, 35, 78, 152),
                                ),
                                controller: _controller.txtCurso,
                                labelText: "Nome do Curso",
                                largura:
                                    MediaQuery.of(context).size.width * 0.5,
                              ),
                              TextFieldCustom(
                                prefixIcon: Icon(
                                  Icons.access_alarm,
                                  color: Color.fromARGB(255, 35, 78, 152),
                                ),
                                controller: _controller.txtTurno,
                                labelText: "Horas",
                                largura:
                                    MediaQuery.of(context).size.width * 0.5,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Observer(builder: (_) {
                            return GestureDetector(
                              onTap: () {
                                _controller.pegarArquivo();
                              },
                              child: _controller.arquivo == null
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.18,
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.archive,
                                              size: 50,
                                              color: Color.fromARGB(
                                                  255, 35, 78, 152)),
                                          Text("Arquivo")
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 35, 78, 152),
                                            width: 3),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                child: Container(
                                                  height: 100,
                                                  width: 100,
                                                  color: Colors.white,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CircleAvatar(
                                                                backgroundColor:
                                                                    Colors.black
                                                                        .withOpacity(
                                                                            0.5),
                                                                radius: 32,
                                                                child:
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(builder: (context) => PdfUser(_controller.arquivo!.path)));
                                                                        },
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .remove_red_eye_outlined,
                                                                          color:
                                                                              Colors.white,
                                                                        ))),
                                                            Text("Visualizar")
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              radius: 32,
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    _controller
                                                                            .arquivo =
                                                                        null;
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .remove_circle_outline_outlined,
                                                                    color: Colors
                                                                        .red,
                                                                  )),
                                                            ),
                                                            Text("Remover")
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.18,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.28,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 35, 78, 152),
                                              width: 3),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Visualizar\n ou\n Remover",
                                          ),
                                        ),
                                      ),
                                    ),
                            );
                          }),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 35, 78, 152),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextButton(
                            onPressed: () {},
                            child: Center(
                                child: Text(
                              "Enviar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ))),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
