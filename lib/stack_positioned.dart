import 'package:flutter/material.dart';

Widget stack_positioned() {
  //* Dentro de um `Stack`, o widget `Positioned` permite controlar a posição de um filho em relação à `Stack`.
  return Center(
    child: Stack(
      children: [
        Container(
          color: Colors.red,
          width: 200,
          height: 200,
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Container(
            color: Colors.blue,
            width: 50,
            height: 50,
          ),
        ),
      ],
    ),
  );
}
