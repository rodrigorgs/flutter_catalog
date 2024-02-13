import 'package:flutter/material.dart';

Widget stack_intro() {
  //* O widget `Stack` permite posicionar seus filhos um sobre o outro.
  return Center(
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          color: Colors.red,
          width: 200,
          height: 200,
        ),
        Container(
          color: Colors.blue,
          width: 50,
          height: 50,
        ),
      ],
    ),
  );
}
