import 'package:dio/dio.dart';
import 'package:servicosunit/models/aluno_model.dart';

class AlunoRepository {
  getAlunos() async {
    try {
      var response = await Dio().get('http://10.0.2.2:8090/aluno/lista');
      print(response);
      return (response.data as List)
          .map((e) => AlunoModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
