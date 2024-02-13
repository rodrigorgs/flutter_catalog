import 'package:flutter/material.dart';

Widget col_flexible() {
  //* Dentro de um `Column`, enquanto o `Expanded` determina a altura exata de seu filho (restrição rígida), o `Flexible` determina a altura *máxima* (restrição flexível).
  //*
  //* No exemplo, o `Column` possui dois filhos, um `Expanded` e um `Flexible`.
  //* O `Expanded` faz seu filho ocupar exatamente 50% da altura da tela.
  //*
  //* Já o `Flexible` faz seu filho ocupar a altura que ele quiser, desde que não ultrapasse 50% da altura da tela.
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
