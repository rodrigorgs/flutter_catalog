import 'package:flutter/material.dart';

Widget col_main_align() {
  //* O eixo principal (mainAxis) de um Column é vertical.
  //* O eixo secundário (crossAxis) de um Column é horizontal.
  //*
  //* O MainAxisAlignment.spaceEvenly distribui o espaço entre os filhos de forma que o espaço entre eles seja o mesmo.
  //* Outras opções: start, end, center, spaceBetween, spaceAround.
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
