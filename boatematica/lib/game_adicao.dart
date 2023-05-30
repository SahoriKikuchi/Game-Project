import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameAdicao(),
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
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Fechar'),
              ),
            ],
          );
        },
      );

      Future.delayed(const Duration(seconds: 2)).then((_) {
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
          return AlertDialog(
            title: const Text('Fim do jogo!'),
            content: Text('Número de acertos: $numAcertos/10'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetGame();
                },
                child: const Text('Jogar Novamente'),
              ),
            ],
          );
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
        title: const Text('Primeira fase'),
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
