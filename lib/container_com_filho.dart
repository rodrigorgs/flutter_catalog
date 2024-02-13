import 'package:flutter/material.dart';

Widget container_com_filho() {
  //* Um **container com filho** sempre escolhe ocupar o menor espaço necessário para **acomodar seu filho**.
  //*
  //* - O `Center` ocupa toda a tela, pois é o widget raiz.
  //* - O `Center` diz ao `Container` que ele pode escolher qualquer tamanho que não ultrapasse o tamanho da tela.
  //* - O `Container` diz ao `Text` que ele pode escolher qualquer tamanho que não ultrapasse o tamanho da tela.
  //* - O `Text` escolhe o tamanho 41x16, suficiente para acomodar o texto.
  //* - O `Container` escolhe ocupar o mesmo tamanho do `Text`.
  return Center(
    child: Container(
      color: Colors.blue,
      child: const Text('Flutter'),
    ),
  );
}
