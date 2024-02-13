import 'package:flutter/material.dart';

Widget col_intro() {
  //* Um `Column` é um widget que organiza seus filhos em uma coluna, de cima para baixo.
  //*
  //* A margem (`margin`) de um `Container` é um espaço vazio adicionado ao redor dele.
  return Column(
    children: [
      Container(
        color: Colors.red,
        width: 50,
        height: 50,
        margin: const EdgeInsets.all(25),
      ),
      Container(
        color: Colors.blue,
        width: 50,
        height: 50,
        margin: const EdgeInsets.all(25),
      ),
    ],
  );
}
