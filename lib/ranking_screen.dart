import 'package:flutter/material.dart';
import 'models/serie.dart';

class RankingScreen extends StatelessWidget {
  final List<SerieVencedora> seriesVencedoras = []; // Lista de séries vencedoras

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ranking das Séries')),
      body: ListView.builder(
        itemCount: seriesVencedoras.length,
        itemBuilder: (context, index) {
          final serie = seriesVencedoras[index];
          return ListTile(
            title: Text('${serie.serie.nome} - Vitórias: ${serie.vitorias}'),
          );
        },
      ),
    );
  }
}
