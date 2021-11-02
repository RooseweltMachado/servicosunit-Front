import 'package:servicosunit/models/solicitacao_model.dart';
import 'package:servicosunit/utils/custom_dio.dart';
import 'package:dio/dio.dart';
class SolicitacaoRepository {
  Future<List<SolicitacaoModel>>? findAll() {
    var dio = Dio();
    return dio.get('http://localhost:8090/solicitacao/lista').then((value) {
      return value.data
          .map<SolicitacaoModel>((v) => SolicitacaoModel.fromMap(v))
          .toList() as List<SolicitacaoModel>;
    }).catchError((err) => print(err));
  }
}
