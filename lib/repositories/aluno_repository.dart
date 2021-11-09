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

  getAlunoPorMatricula(String matricula) async {
    try {
      var response =
          await Dio().get('http://10.0.2.2:8090/busca/aluno/$matricula');
      print(response);
      return (response.data as List)
          .map((e) => AlunoModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  postCadastrarAluno(Map<String, dynamic> body) async {
    try {
      var response =
          await Dio().post('http://10.0.2.2:8090/cadastro/aluno', data: body);
      print(response);
      return (response.data as List)
          .map((e) => AlunoModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  uploadFoto(MultipartFile file) async {
    try {
      var response = await Dio()
          .post('http://10.0.2.2:8090/api/file/v1/uploadFile', data: file);
      print(response);
      return (response.data as List)
          .map((e) => AlunoModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
