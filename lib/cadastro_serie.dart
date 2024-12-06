import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastroSerieScreen extends StatefulWidget {
  @override
  _CadastroSerieScreenState createState() => _CadastroSerieScreenState();
}

class _CadastroSerieScreenState extends State<CadastroSerieScreen> {
  final _nomeController = TextEditingController();
  final _generoController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _pontuacaoController = TextEditingController();

  FirebaseDatabase _database = FirebaseDatabase.instance;

  void _salvarSerie() {
    final nome = _nomeController.text;
    final genero = _generoController.text;
    final descricao = _descricaoController.text;
    final pontuacao = int.parse(_pontuacaoController.text);

    // Salvar no Firebase
    DatabaseReference ref = _database.ref().child("series").push();
    ref.set({
      "nome": nome,
      "genero": genero,
      "descricao": descricao,
      "pontuacao": pontuacao,
    }).then((_) {
      print('Série salva!');
    }).catchError((error) {
      print('Erro ao salvar a série: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Série')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campos para dados da série
            ElevatedButton(
              onPressed: _salvarSerie,
              child: Text('Salvar Série'),
            ),
          ],
        ),
      ),
    );
  }
}
