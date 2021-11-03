import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:servicosunit/logics/listagem_controller.dart';

class Concept2List extends StatefulWidget {
  Concept2List({Key? key}) : super(key: key);

  _Concept2ListState createState() => _Concept2ListState();
}

class _Concept2ListState extends State<Concept2List> {
  late ListagemController _controller;

  @override
  void initState() {
    _controller = ListagemController();
    _controller.getAlunos();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 35, 78, 152),
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "Listagem Customizada2",
            style: TextStyle(fontFamily: "Sofia"),
          ),
        ),
        body: Observer(builder: (_) {
          return Container(
            child: ListView.builder(
                itemCount: _controller.listAlunos.length,
                itemBuilder: (_, index) {
                  if (_controller.listAlunos.length == 0) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    var item = _controller.listAlunos[index];
                    String foto = item.fotourl ?? "";
                    String nome = item.nomeAluno ?? "";
                    String curso = item.curso ?? "";
                    double horas = item.quantidadeHoras ?? 0;
                    foto = foto.replaceAll('localhost', '10.0.2.2');
                    return card(foto, nome, curso, horas);
                  }
                }),
          );
        }));
  }

  Widget card(String img, String title, String date, double horas) {
    String? hrs = horas.toString();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 19.0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 135.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Sans",
                              fontSize: 16.5),
                        ),
                        Text(
                          date,
                          style: const TextStyle(
                              fontFamily: "Sans",
                              fontWeight: FontWeight.w400,
                              fontSize: 13.5,
                              color: Colors.black26),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 27.0,
                    width: 80.0,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(20.0)),
                        color: Color(0xFF4A00E0)),
                    child: Center(
                      child: Text("$hrs hrs",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 8.0,
                      color: Colors.black12.withOpacity(0.2),
                      spreadRadius: 5.0)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
