import 'package:flutter/material.dart';

Widget col_intro() {
  //* Um Column é um widget que organiza seus filhos em uma coluna, de cima para baixo.

  return Column(
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
