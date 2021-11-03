class AlunoModel {
  String? curso;
  String? fotourl;
  int? id;
  String? matricula;
  double? quantidadeHoras;
  String? senha;
  String? turno;
  String? nomeAluno;

  AlunoModel(
      {this.curso,
      this.fotourl,
      this.id,
      this.matricula,
      this.quantidadeHoras,
      this.senha,
      this.turno,
      this.nomeAluno});

  AlunoModel.fromJson(Map<String, dynamic> json) {
    curso = json['curso'];
    fotourl = json['fotourl'];
    id = json['id'];
    matricula = json['matricula'];
    quantidadeHoras = json['quantidadeHoras'];
    senha = json['senha'];
    turno = json['turno'];
    nomeAluno = json['nomeAluno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curso'] = curso;
    data['fotourl'] = fotourl;
    data['id'] = id;
    data['matricula'] = matricula;
    data['quantidadeHoras'] = quantidadeHoras;
    data['senha'] = senha;
    data['turno'] = turno;
    data['nomeAluno'] = nomeAluno;
    return data;
  }
}
