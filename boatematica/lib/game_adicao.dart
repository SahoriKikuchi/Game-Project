import 'dart:async';
import 'dart:math';

import 'package:boatematica/game_2fase.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
            //Esse Stack() é onde estamos colocando o .gif de fundo
            children: <Widget>[
              SizedBox.expand(
                child: Image.asset(
                  'assets/background.gif',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.center,
                  margin: const EdgeInsets.all(40),
                  color: Colors.white.withOpacity(0.75),
                  padding: const EdgeInsets.all(16.0),
                  child: GameAdicao()
              ),
            ],
          ),
    );
  }
}

class GameAdicao extends StatefulWidget {
  @override
  _GameAdicaoState createState() => _GameAdicaoState();
}

class _GameAdicaoState extends State<GameAdicao> {
  Random random = Random();
  int num1 = 0;
  int num2 = 0;
  int respostaCorreta = 0;
  List<int> opcoesRespostas = [];

  List<String> imagensParabens = [
    'assets/parabens1.jpg',
    'assets/parabens2.jpg',
    'assets/parabens3.jpg',
  ];

  List<String> imagensConsolacao = [
    'assets/consolacao1.jpg',
    'assets/consolacao2.jpg',
  ];

  int numPergunta = 0;
  int numAcertos = 0;
  int dificuldade = 1;

  @override
  void initState() {
    super.initState();
    gerarQuestao();
  }

  void gerarQuestao() {
    num1 = random.nextInt(dificuldade * 10);
    num2 = random.nextInt(dificuldade * 10);
    respostaCorreta = num1 + num2;

    opcoesRespostas.clear();
    opcoesRespostas.add(respostaCorreta);

    while (opcoesRespostas.length < 10) {
      int opcao = random.nextInt(dificuldade * 20);
      if (!opcoesRespostas.contains(opcao)) {
        opcoesRespostas.add(opcao);
      }
    }

    opcoesRespostas.shuffle();
  }

  void verificarResposta(int resposta) {
    if (resposta == respostaCorreta) {
      numAcertos++;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          int index = random.nextInt(imagensParabens.length);
          String imagemParabens = imagensParabens[index];

          return AlertDialog(
            content: Image.asset(imagemParabens),
          );
        },
      );

      Future.delayed(const Duration(seconds: 2)).then((_) {
        Navigator.of(context).pop();
        proximaPergunta();
      });
    } else {
     showDialog(
        context: context,
        builder: (BuildContext context) {
          int index = random.nextInt(imagensConsolacao.length);
          String imagemConsolacao = imagensConsolacao[index];
          return AlertDialog(
            content: Image.asset(imagemConsolacao),
          );
        },
      );

      Future.delayed(const Duration(seconds: 2)).then((_) {
        Navigator.of(context).pop();
        proximaPergunta();
      });
    }
  }

void proximaPergunta() {
  numPergunta++;
  if (numPergunta < 10) {
    if (numPergunta % 3 == 0) {
      aumentarDificuldade();
    }
    setState(() {
      gerarQuestao();
    });
  } else {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        if (numAcertos > 7) {
          // If number of correct answers is greater than 7, show a success message
          return AlertDialog(
            title: const Text('Parabéns!'),
            content: Text('Você concluiu a primeira fase com $numAcertos acertos.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  MaterialPageRoute(builder: (context) => GameMenuScreen2());
                },
                child: const Text('Próxima Fase'),
              ),
            ],
          );
        } else {
          // If number of correct answers is 7 or lower, show a retry message
          return AlertDialog(
            title: const Text('Fase não concluída'),
            content: Text('Você precisa de mais acertos para concluir a fase atual.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetGame();
                },
                child: const Text('Refazer Fase'),
              ),
            ],
          );
        }
      },
    );
  }
}


  void aumentarDificuldade() {
    dificuldade++;
  }

  void resetGame() {
    setState(() {
      numPergunta = 0;
      numAcertos = 0;
      dificuldade = 1;
      gerarQuestao();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adição'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pergunta $numPergunta de 10',
              style: const TextStyle(fontSize: 24.0),
            ),
            //SizedBox(height: 16.0),
            //Text(
              //'Dificuldade $dificuldade',
              //style: TextStyle(fontSize: 24.0),
            //),
            const SizedBox(height: 16.0),
            Text(
              '$num1 + $num2 = ?',
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          verificarResposta(opcoesRespostas[0]);
                        },
                        child: Text('${opcoesRespostas[0]}'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          verificarResposta(opcoesRespostas[1]);
                        },
                        child: Text('${opcoesRespostas[1]}'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          verificarResposta(opcoesRespostas[2]);
                        },
                        child: Text('${opcoesRespostas[2]}'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          verificarResposta(opcoesRespostas[3]);
                        },
                        child: Text('${opcoesRespostas[3]}'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          verificarResposta(opcoesRespostas[4]);
                        },
                        child: Text('${opcoesRespostas[4]}'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          verificarResposta(opcoesRespostas[5]);
                        },
                        child: Text('${opcoesRespostas[5]}'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          verificarResposta(opcoesRespostas[6]);
                        },
                        child: Text('${opcoesRespostas[6]}'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          verificarResposta(opcoesRespostas[7]);
                        },
                        child: Text('${opcoesRespostas[7]}'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          verificarResposta(opcoesRespostas[8]);
                        },
                        child: Text('${opcoesRespostas[8]}'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          verificarResposta(opcoesRespostas[9]);
                        },
                        child: Text('${opcoesRespostas[9]}'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
