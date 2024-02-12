import 'package:flutter/material.dart';

Widget container_sem_filho() {
  //* Um container sem filhos ocupa todo o espaço disponibilizado pelo widget pai.
  //*
  //* O Center permite que o Container escolha seu próprio tamanho.
  //* O Container escolhe ocupar todo o tamanho disponível.
  return Center(
    child: Container(
      color: Colors.blue,
    ),
  );
}
