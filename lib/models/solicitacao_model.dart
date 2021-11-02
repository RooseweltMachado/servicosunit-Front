class SolicitacaoModel {
  String? dataTermino;
  String? matriculaAluno;
  String? nomeCurso;
  String? urlPdf;
  bool? homolog;
  double? qtdHoras;

  SolicitacaoModel(
      {this.dataTermino,
      this.homolog,
      this.matriculaAluno,
      this.nomeCurso,
      this.qtdHoras,
      this.urlPdf});

  static SolicitacaoModel? fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SolicitacaoModel(
      dataTermino: map['dataTermino'],
      homolog: map['homolog'],
      matriculaAluno: map['matriculaAluno'],
      nomeCurso: map['nomeCurso'],
      qtdHoras: map['qtdHoras'],
      urlPdf: map['urlPdf'],
    );
  }
}
