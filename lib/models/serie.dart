class Serie {
  final String nome;
  final String genero;
  final String descricao;
  final String capaUrl;
  final double pontuacao;

  Serie({
    required this.nome,
    required this.genero,
    required this.descricao,
    required this.capaUrl,
    required this.pontuacao,
  });
}

class SerieVencedora {
  final Serie serie;
  int vitorias;

  SerieVencedora({required this.serie, this.vitorias = 0});
}
