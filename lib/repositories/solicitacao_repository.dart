import 'package:servicosunit/models/solicitacao_model.dart';
import 'package:servicosunit/utils/custom_dio.dart';
import 'package:dio/dio.dart';

class SolicitacaoRepository {
  getSolicitacao() async {
    try {
      var response = await Dio().get('http://10.0.2.2:8090/solicitacao/lista');
      print(response);
      return (response.data as List)
          .map((e) => SolicitacaoModel.fromMap(e))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  // getSolicitacaoPesquisa() async{
  //   try{
  //     var response = await Dio().get('http://10.0.2.2:8090/solicitacao/lista');
  //   }catch(e){}
  // }
}
