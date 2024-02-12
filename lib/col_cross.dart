import 'package:flutter/material.dart';

Widget col_cross() {
  //* O eixo secundário (crossAxis) de um Column é horizontal.
  //*
  //* O CrossAxisAlignment.end alinha os filhos no final do eixo secundário (no nosso caso, o final é o lado direito).
  //* Outras opções: start, center, stretch (estica os filhos para ocupar toda a largura da coluna).
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
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
