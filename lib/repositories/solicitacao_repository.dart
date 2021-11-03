import 'dart:io';

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

  getArquivo(String url) async {
    Directory? externalDir;
    try {
      var response = await Dio().get(url);
      return response.data;
    } on DioError catch (e) {
      throw (e.message);
    }
  }
  // Future<File> getFileFromUrl(String url, {name}) async {
  //   var fileName = 'testonline';
  //   if (name != null) {
  //     fileName = name;
  //   }
  //   try {
  //     var data = await http.get(url);
  //     var bytes = data.bodyBytes;
  //     var dir = await getApplicationDocumentsDirectory();
  //     File file = File("${dir.path}/" + fileName + ".pdf");
  //     print(dir.path);
  //     File urlFile = await file.writeAsBytes(bytes);
  //     return urlFile;
  //   } catch (e) {
  //     throw Exception("Error opening url file");
  //   }
  // }
}
