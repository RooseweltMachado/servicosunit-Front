import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:servicosunit/logics/listagem_controller.dart';
import 'package:servicosunit/widgets/textfield_custom.dart';

class ListagemPage extends StatefulWidget {
  const ListagemPage({Key? key}) : super(key: key);

  @override
  _ListagemPageState createState() => _ListagemPageState();
}

class _ListagemPageState extends State<ListagemPage> {
  late ListagemController _controller;
  List<SolicitacaoModel> lista = [
    SolicitacaoModel(
        nome: "Roosewelt",
        atividade: "Programação",
        qtdHoras: "40",
        status: "Homologado"),
    SolicitacaoModel(
        nome: "Qaaa",
        atividade: "Q.A",
        qtdHoras: "30",
        status: "Não homologado"),
    SolicitacaoModel(
        nome: "Roosewelt Machado de França",
        atividade: "Scrum",
        qtdHoras: "30",
        status: "Não homologado"),
  ];

  @override
  void initState() {
    _controller = ListagemController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFieldCustom(
                    prefixIcon: IconButton(
                      onPressed: () {
                        print("pesquisaaaaa");
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    controller: _controller.txtPesquisa,
                    labelText: "Pesquisar por nome"),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Lista de solicitações:",
                    style: TextStyle(
                        color: Color.fromARGB(255, 35, 78, 152),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Clique no item para abrir o detalhamento, arraste o card para o lado esquerdo para a opção de abrir o arquivo ou para o lado direito e obtenha as opções de aceitar e recusar o pedido."),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.grey[350],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          child: Text(
                        "Nome",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                      Container(
                          child: Text(
                        "Atividade",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                      Container(
                          child: Text(
                        "Horas",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                      Container(
                          child: Text(
                        "Status",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, index) {
                        String nome = lista[index].nome ?? "";
                        String atividade = lista[index].atividade ?? "";
                        String qtdHoras = lista[index].qtdHoras ?? "";
                        String status = lista[index].status ?? "";
                        return _buildCard(
                            nome, atividade, qtdHoras, status, index);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildCard(String nome, String atividade, String qtdHoras, String status,
      int index) {
    double result = index % 2;
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Abrir',
          color: Colors.yellow[700],
          icon: Icons.archive_outlined,
        ),
      ],
      actions: <Widget>[
        IconSlideAction(
          caption: 'Aceitar',
          color: Colors.blue,
          icon: Icons.done,
        ),
        IconSlideAction(
          caption: 'Recusar',
          color: Colors.indigo,
          icon: Icons.close,
        ),
      ],
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [Text("Nome: "), Text(nome)],
                          ),
                          Row(
                            children: [Text("Atividade: "), Text(atividade)],
                          ),
                          Row(
                            children: [
                              Text("Quantidade de horas: "),
                              Text(qtdHoras)
                            ],
                          ),
                          Row(
                            children: [Text("Status: "), Text(status)],
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Clica fora para fechar ",
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: Container(
          decoration: BoxDecoration(
            color: result == 0 ? Colors.grey[100] : Colors.white,
          ),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    nome,
                    overflow: TextOverflow.ellipsis,
                  )),
              Container(
                width: 1,
                color: Color.fromARGB(255, 35, 78, 152),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.27,
                  child: Text(
                    atividade,
                    overflow: TextOverflow.ellipsis,
                  )),
              Container(
                width: 1,
                color: Color.fromARGB(255, 35, 78, 152),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Text(qtdHoras)),
              Container(
                width: 1,
                color: Color.fromARGB(255, 35, 78, 152),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    status,
                    overflow: TextOverflow.visible,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class SolicitacaoModel {
  final String? nome;
  final String? atividade;
  final String? qtdHoras;
  final String? status;

  SolicitacaoModel({this.nome, this.atividade, this.qtdHoras, this.status});
}
