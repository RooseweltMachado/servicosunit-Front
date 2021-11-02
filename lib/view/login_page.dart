import 'package:flutter/material.dart';
import 'package:servicosunit/logics/login_controller.dart';
import 'package:servicosunit/view/solicitacao_page.dart';
import 'package:servicosunit/widgets/textfield_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      TextFieldCustom(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 35, 78, 152),
                          ),
                          controller: controller.txtMatricula,
                          labelText: "Matricula"),
                      TextFieldCustom(
                          prefixIcon: Icon(
                            Icons.keyboard,
                            color: Color.fromARGB(255, 35, 78, 152),
                          ),
                          controller: controller.txtSenha,
                          labelText: "Senha"),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 35, 78, 152),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SolicitacaoPage(),
                                ),
                              );
                            },
                            child: Center(
                                child: Text(
                              "Entrar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ))),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
