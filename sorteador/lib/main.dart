import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(PaginaInicial());
}

//Responsável pela mudança de estado
// ignore: use_key_in_widget_constructors
class PaginaInicial extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Sorteador createState() {
    return _Sorteador();
  }
}

//Método responsével por sortear
class _Sorteador extends State<PaginaInicial> {
  var numero = 0;

  void _sortear() {
    setState(() {
      numero = 1 + Random().nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Sorteador')),
        body:
            //Container que centraliza e recebe o número sorteado
            Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Visibility(
                  visible: numero != 0,
                  replacement: const Text(
                    "Clique no botão",
                    style: TextStyle(
                        fontSize: 30, fontFamily: AutofillHints.countryCode),
                  ),
                  child: const Text(
                    'Número sorteado: ',
                    style: TextStyle(
                        fontSize: 30, fontFamily: AutofillHints.countryCode),
                  ),
                ),
              ),
              //Container que recebe a mudança de estado
              Container(
                padding: const EdgeInsets.all(20),
                child: Visibility(
                  visible: numero != 0,
                  replacement: const Text(
                    "Aperte o botão para sortear",
                    style: TextStyle(fontSize: 20, height: 2),
                  ),
                  child: Text(
                    '$numero',
                    style: const TextStyle(fontSize: 40, color: Colors.indigo),
                  ),
                ),
              ),
              // Container Para o Botão
              Container(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 25)),
                      elevation: const MaterialStatePropertyAll(20),
                      minimumSize:
                          MaterialStateProperty.all(const Size(150, 40))),
                  onPressed: _sortear,
                  child: const Text("Sortear!"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
