import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:servicosunit/logics/cadastro_controller.dart';
import 'package:servicosunit/widgets/textfield_custom.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  late CadastroController controller;

  @override
  void initState() {
    controller = CadastroController();
    super.initState();
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
                        controller: controller.txtMatricula,
                        labelText: "Matricula",
                      ),
                      TextFieldCustom(
                        prefixIcon: Icon(
                          Icons.keyboard,
                          color: Color.fromARGB(255, 35, 78, 152),
                        ),
                        controller: controller.txtSenha,
                        labelText: "Senha",
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
                                controller: controller.txtCurso,
                                labelText: "Curso",
                                largura:
                                    MediaQuery.of(context).size.width * 0.5,
                              ),
                              TextFieldCustom(
                                prefixIcon: Icon(
                                  Icons.access_alarm,
                                  color: Color.fromARGB(255, 35, 78, 152),
                                ),
                                controller: controller.txtTurno,
                                labelText: "Turno",
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
                                controller.seletor(context);
                              },
                              child: controller.imagemTemporaria == null
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
                                          Icon(Icons.add_a_photo,
                                              size: 50,
                                              color: Color.fromARGB(
                                                  255, 35, 78, 152)),
                                          Text("Adicionar foto")
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
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.18,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.28,
                                        child: ClipRect(
                                            child:
                                                Image.file(controller.imagem!)),
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
                              "Cadastrar",
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
