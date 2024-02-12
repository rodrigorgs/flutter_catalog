import 'package:flutter/material.dart';

Widget col_flexible() {
  //* Dentro de um Column, enquanto o Expanded dentro de um Column determina uma altura exata para seu filho, o Flexible determina a altura *máxima*.
  //*
  //* No exemplo, o Column possui dois filhos, um Expanded e um Flexible.
  //* O Column pergunta ao Expanded que altura ele quer assumir. Ele diz que quer ter 50% da altura da tela.
  //*
  //* O Column também pergunta ao Flexible que altura ele quer assumir.
  //* O Flexible então pergunta ao seu filho, Container, que altura ele quer assumir, entre 0 e 50% da altura da tela.
  //* O Container responde que quer ter 16 pixels, o suficiente para acomodar o seu filho, o Text.
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        child: Container(
          color: Colors.blue,
          height: 999,
          child: const Text("B"),
        ),
      ),
      Flexible(
        child: Container(
          color: Colors.red,
          child: const Text("C"),
        ),
      ),
    ],
  );
}
