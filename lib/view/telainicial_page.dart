import 'package:flutter/material.dart';
import 'package:servicosunit/view/cadastro_page.dart';
import 'package:servicosunit/view/login_page.dart';
import 'package:servicosunit/widgets/button_large.dart';

import 'home_secretaria.dart';

class TelaInicialPage extends StatelessWidget {
  const TelaInicialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 35, 78, 152),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 200,
              width: 200,
              child: Image.network(
                  "https://play-lh.googleusercontent.com/IpPntxBn6fUB_7SgH3UvCDgzlvcUKwQ9dReYPMJJfIxBuJiz7qCL5wdqHM4yvFLvBA"),
            ),
            Text(
              "Deseja fazer login como:",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 55, right: 20),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ButtonLargeWidget(
                      "https://image.flaticon.com/icons/png/512/91/91112.png",
                      "Secretária", () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeSecretariaPage(),
                      ),
                    );
                  }),
                  SizedBox(
                    width: 15,
                  ),
                  ButtonLargeWidget(
                      "https://cdn-icons-png.flaticon.com/512/57/57073.png",
                      "Aluno", () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            titleTextStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                            title: Text("Você ja tem um aluno cadastrado?"),
                            actions: <Widget>[
                              FlatButton(
                                height: 35,
                                minWidth: 20,
                                color: Colors.red[700],
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => CadastroPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "  Não  ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                width: .09,
                              ),
                              FlatButton(
                                height: 35,
                                minWidth: 20,
                                color: Colors.green[800],
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "  Sim  ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                              ),
                            ],
                          );
                        });
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
