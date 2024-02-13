import 'package:flutter/material.dart';

Widget col_flex() {
  //* O widget `Expanded` possui um atributo, `flex`, que determina a proporção do espaço restante que ele ocupará no eixo principal.
  //*
  //* No exemplo, o primeiro `Expanded` possui `flex` 2 e o segundo possui `flex` 5.
  //* Isso significa que o espaço restante será dividido em 7 partes (2 + 5). O primeiro `Expanded` ocupará 2 dessas partes e o segundo ocupará 5.
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        flex: 2,
        child: Container(
          color: Colors.blue,
          child: const Text("B"),
        ),
      ),
      Expanded(
        flex: 5,
        child: Container(
          color: Colors.red,
          child: const Text("C"),
        ),
      ),
    ],
  );
}
