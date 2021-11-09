class SolicitacaoModel {
  int? id;
  String? atividade;
  String? matriculaAluno;
  String? nomeCurso;
  String? urlPdf;
  bool? homolog;
  double? qtdHoras;

  SolicitacaoModel(
      {this.id,
      this.atividade,
      this.homolog,
      this.matriculaAluno,
      this.nomeCurso,
      this.qtdHoras,
      this.urlPdf});

  static SolicitacaoModel fromMap(Map<String, dynamic> map) {
    return SolicitacaoModel(
      id: map['id'],
      atividade: map['atividade'],
      homolog: map['homolog'],
      matriculaAluno: map['matriculaAluno'],
      nomeCurso: map['nomeCurso'],
      qtdHoras: map['qtdHoras'],
      urlPdf: map['urlPdf'],
    );
  }
}
