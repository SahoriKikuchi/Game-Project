import 'package:boatematica/game_1fase.dart';
import 'package:flutter/material.dart';
import 'package:boatematica/credits.dart';

class Home extends StatelessWidget {
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
                      MaterialPageRoute(builder: (context) => GameMenuScreen1()),
                    );
                  },
                  child: Container(
                    child: Image.asset(
                      'assets/botao_play.png',
                      width: 150,
                      height: 50,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Creditos()),
                    );
                  },
                  child: Container(
                    child: Image.asset(
                      'assets/botao_creditos.png',
                      width: 150,
                      height: 50,
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
