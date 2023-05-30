import 'package:boatematica/game_adicao.dart';
import 'package:boatematica/game_divisao.dart';
import 'package:boatematica/game_multiplicacao.dart';
import 'package:boatematica/game_subtracao.dart';
import 'package:flutter/material.dart';

void main() => runApp(GameMenuScreen1());

class GameMenuScreen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar( backgroundColor: Colors.blue, title: Text('Boatematica'),),
      body: Stack(
      //Esse Stack() é onde estamos colocando o .gif de fundo
        children: <Widget>[
          SizedBox.expand(
            child: Image.asset(
              'assets/background.gif', 
              fit: BoxFit.cover,
            ),
          ),
          Center(
            //Esse Center() é onde estamos colocando os botões de play e créditos
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GameAdicao()),
                      //MaterialPageRoute(builder: (context) => GameAdicao()),
                    );
                  },
                  child: Container(
                    child: Image.asset(
                      'assets/soma.png',
                      width: 125,
                      height: 125,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    final snackBar = SnackBar(
                      content: 
                      Text('Nível 2 - Bloqueado'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    child: Image.asset(
                      'assets/subtracao_b.png',
                      width: 125,
                      height: 125,
                    ),
                  ),
                ),
                InkWell(
                 onTap: () {
                    // ignore: prefer_const_declarations
                    final snackBar = const SnackBar(
                      content: 
                      Text('Nível 3 - Bloqueado'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    child: Image.asset(
                      'assets/multiplicacao_b.png',
                      width: 125,
                      height: 125,
                    ),
                  ),
                ),
                InkWell(
                 onTap: () {
                    final snackBar = SnackBar(
                      content: 
                      Text('Nível 4 - Bloqueado'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    child: Image.asset(
                      'assets/divisao_b.png',
                      width: 125,
                      height: 125,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
