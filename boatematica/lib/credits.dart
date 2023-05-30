import 'package:flutter/material.dart';

class Creditos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Créditos',
            style: TextStyle(fontFamily: 'Creditos'),
          ),
        ),
        body: Stack(
            //Esse Stack() é onde estamos colocando o .gif de fundo
            children: <Widget>[
              SizedBox.expand(
                child: Image.asset(
                  'assets/background.gif',
                  fit: BoxFit.cover,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(40),
                  color: Colors.white.withOpacity(0.75),
                  padding: const EdgeInsets.all(16.0),
                  child: Column( 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 24),
                      Text(
                        'Boatematica: ',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Titulo'),
                      ),
                      Text(
                        'Aventura no Gelo',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Titulo'),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Desenvolvedores do IFSP/SBV:',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Creditos'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Amanda Sahori',
                        style: TextStyle(fontSize: 20, fontFamily: 'Creditos'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Guilherme Tessarini',
                        style: TextStyle(fontSize: 20, fontFamily: 'Creditos'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Isabella Alegrette',
                        style: TextStyle(fontSize: 20, fontFamily: 'Creditos'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Laís Barros',
                        style: TextStyle(fontSize: 20, fontFamily: 'Creditos'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Rodrigo Yamaguchi',
                        style: TextStyle(fontSize: 20, fontFamily: 'Creditos'),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Alunos de pedagogia UNIFAE:',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Creditos'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Karoline Eduarda Soares',
                        style: TextStyle(fontSize: 20, fontFamily: 'Creditos'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Veronica Schiavon Carrilho',
                        style: TextStyle(fontSize: 20, fontFamily: 'Creditos'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Jessica Ariane Goskos Rezende',
                        style: TextStyle(fontSize: 20, fontFamily: 'Creditos'),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Orientadores:',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Creditos'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Prof. Dr. Vinícius Andrade - UNIFAE',
                        style: TextStyle(fontSize: 20, fontFamily: 'Creditos'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Prof. Esp. Marcelo Ciacco - IFSP/SBV',
                        style: TextStyle(fontSize: 20, fontFamily: 'Creditos'),
                      ),
                      /* SizedBox(height: 24),
            Text(
              'Versão do Jogo:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Creditos'),
            ),
            SizedBox(height: 8),
            Text(
              '1.0',
              style: TextStyle(fontSize: 20, fontFamily: 'Creditos'),
            ),
            */
                      /*SizedBox(height: 24),
            Text(
              'Aventura no gelo - Boatematica',
              style: TextStyle(fontSize: 16, fontFamily: 'Creditos'),
            ),
            */
                      SizedBox(height: 12),
                      Text(
                        'IFSP e UNIFAE © 2023',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Creditos'),
                      ),
                      Text(
                        'Todos os direitos reservados.',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Creditos'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      );
  }
}
