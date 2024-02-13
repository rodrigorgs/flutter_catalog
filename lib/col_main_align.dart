import 'package:flutter/material.dart';

Widget col_main_align() {
  //* O eixo principal (`mainAxis`) de um Column é vertical.
  //*
  //* A opção `MainAxisAlignment.center` alinha os filhos no centro do eixo principal.
  //* Experimente outras opções: `start`, `end`, `spaceEvenly`, `spaceBetween`, `spaceAround`.
  //*
  //* > O widget `Row` é similar ao `Column`, mas organiza seus filhos em uma linha horizontal (eixo principal), da esquerda para a direita.
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.red,
        width: 50,
        height: 50,
      ),
      Container(
        color: Colors.blue,
        width: 50,
        height: 50,
      ),
    ],
  );
}
