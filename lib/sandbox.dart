import 'package:flutter/material.dart';

Widget sandbox() {
  //* O Column ocupa toda a altura disponível, por padrão.
  //*
  //* Com a opção mainAxisSize: MainAxisSize.min, o Column ocupa apenas a altura necessária para acomodar seus filhos.
  return Center(
    child: Container(
      color: Colors.grey,
      padding: const EdgeInsets.all(20),
      child: const Column(
        mainAxisSize: MainAxisSize.min, // <-
        children: [
          Text("ABC"),
          Text("DEF"),
        ],
      ),
    ),
  );
}
