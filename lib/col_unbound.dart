import 'package:flutter/material.dart';

Widget col_unbound() {
  //* Existem três tipos de restrição de largura/altura de um widget:
  //*
  //* - **rígida** (*tight*): o widget deve ter uma largura/altura específica.
  //* - **flexível** (*loose*): o widget pode ter qualquer largura/altura dentro de uma faixa.
  //* - **ilimitada** (*unbounded*): o widget pode ter qualquer largura/altura, de 0 a infinito.
  //*
  //* Por padrão, o `Column` é flexível quanto à largura de seus filhos, mas ilimitado quando à altura.
  //*
  //* No exemplo, como o `Column` não restringe a altura do `Container`, este escolhe o tamanho especificado, 999 pixels, e acaba transbordando (*overflowing*) para fora da tela.
  return Column(
    children: [
      Container(
        color: Colors.red,
        height: 999,
      ),
    ],
  );
}
