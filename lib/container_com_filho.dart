import 'package:flutter/material.dart';

Widget container_com_filho() {
  //* Um Container com filho ocupa o espaço necessário para acomodar o filho.
  //*
  //* O Center permite que o Container escolha seu próprio tamanho.
  //* O Center pergunta ao Text qual tamanho ele quer.
  //* O Container escolhe ocupar o mesmo tamanho do Text.
  return Center(
    child: Container(
      color: Colors.blue,
      child: const Text('Flutter'),
    ),
  );
}
