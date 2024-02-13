import 'package:flutter/material.dart';

Widget container_padding() {
  //* O `Container`, quando possui um enchimento (`padding`), ocupa o espaço necessário para acomodar o filho mais o enchimento.
  //*
  //* Esse exemplo mostra ainda bordas arredondadas e sombra.
  return Center(
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: const Text('Flutter'),
    ),
  );
}
