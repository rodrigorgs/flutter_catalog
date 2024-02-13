import 'package:flutter/material.dart';

Widget col_expanded() {
  //* O widget `Expanded`, quando dentro de um `Column`, faz com que o filho ocupe toda a altura restante da coluna.
  //*
  //* Havendo mais de um `Expanded`, a altura restante é dividida igualmente entre eles.
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        color: Colors.red,
        child: const Text("A"),
      ),
      Expanded(
        child: Container(
          color: Colors.blue,
          child: const Text("B"),
        ),
      ),
      Expanded(
        child: Container(
          color: Colors.red,
          child: const Text("C"),
        ),
      ),
    ],
  );
}
