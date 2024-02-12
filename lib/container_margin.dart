import 'package:flutter/material.dart';

Widget container_margin() {
  //* A margem (margin) de um Container é o espaço ao redor do filho.
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
