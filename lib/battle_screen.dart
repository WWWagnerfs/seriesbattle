import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BattleScreen extends StatefulWidget {
  @override
  _BattleScreenState createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  Artboard? _riveArtboard;
  late RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    _loadRiveAnimation();
  }

  // Carregar animação Rive
  void _loadRiveAnimation() async {
    final file = await RiveFile.asset('images/untitled.riv');
    final artboard = file.mainArtboard;

    setState(() {
      _riveArtboard = artboard;
      _controller = SimpleAnimation('idle'); // Nome da animação
      artboard.addController(_controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela de Batalha')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _riveArtboard != null
                ? Container(
              height: 400, // Tamanho ajustável
              child: Rive(artboard: _riveArtboard!),
            )
                : CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Escolha a série vencedora!'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controller.isActive = true;
                });
              },
              child: Text('Escolher Vencedor'),
            ),
          ],
        ),
      ),
    );
  }
}
