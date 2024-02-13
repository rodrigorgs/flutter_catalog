import 'package:flutter/material.dart';

Widget widget_raiz() {
  //* Lembre-se que **o widget raiz sempre ocupa a tela toda**.
  //*
  //* No exemplo, o tamanho informado pelo programador (100x100) é ignorado, de forma que o `Container` ocupa todo o espaço disponível.
  return Container(
    color: Colors.red,
    width: 100,
    height: 100,
  );
}
